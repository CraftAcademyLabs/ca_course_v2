It's time to get our hands dirty ;-) and do some exercises. The main purpose of this section is to get all set up with git and get some basic understanding of the moving parts of git from a practical perspective. 

### tree, blob, commit by example

Let's create a new folder ind initiate a new git repository.
```
$ mkdir git_internals
$ cd git_internals
$ git init
Initialized empty Git repository in /git_internals/.git/
```
This creates the _.git_ directory with the all the sub-directories above but they are empty.
```
$ ls .git/objects
info	pack
```
Next up, we'll create a single file and add some content to it and add it to our staging.
```
$ echo "Some content" > first.txt
$ git add first.txt
```
Let's check the content of the objects sub-folder again.
```
$ ls .git/objects
0e	info	pack
```
Staging a file create the _blob_ file in the _objects_ sub-directory with the path _.git/objects/_0e/e389557af36e8d030f7fdc724f2185280c4dd4_._ This blob has the contents of the file and has type _blob._ A blob is essentially the content of the file at a particular instance.

We can take a closer look using git cat-file - a command used to view the contents and type of objects.
```
$ git cat-file -p 0ee389557af36e8d030f7fdc724f2185280c4dd4
Some content
$ git cat-file -t 0ee389557af36e8d030f7fdc724f2185280c4dd4
blob
$ git cat-file -s 0ee389557af36e8d030f7fdc724f2185280c4dd4
13
```
Let's check our status
```
$ git status
On branch master
No commits yet
Changes to be committed:
  (use "git rm --cached <file>..." to unstage)
	new file:   first.txt
```
Let's create a commit and see what happens in the objects folder
```
$ git commit -m "First file"

[master (root-commit) 48863b5] First file
 1 file changed, 1 insertion(+)
 create mode 100644 first.txt

$ git log

commit 48863b5e1ebfee389ed64e19ec97698c529d17ab (HEAD -> master)
Author: Thomas <thomas@craftacademy.se>
Date:   Wed Jul 3 05:54:34 2019 +0200
    First file
```
This creates two more object files in the object sub-directory. One is a tree object and other a commit object.
```
$ ls .git/objects
0e	48	ae	info	pack
```
  
```
$ git cat-file -p 48863b5e1ebfee389ed64e19ec97698c529d17ab

tree ae49862b12d89de7bdc67f6924f7cf8549a8a457
author Thomas <thomas@craftacademy.se> 1562126074 +0200
committer Thomas <thomas@craftacademy.se> 1562126074 +0200

First file
$ git cat-file -t 48863b5e1ebfee389ed64e19ec97698c529d17ab
commit
```
  

Running a _git cat-file_ command on the SHA-1 of the last commit above shows the that object is a commit object and contains reference to a tree object. We can see that the tree object contains the reference to the individual blob objects that we saw earlier.
```
$ git cat-file -t ae49862b12d89de7bdc67f6924f7cf8549a8a457
tree
$ git cat-file -p ae49862b12d89de7bdc67f6924f7cf8549a8a457
100644 blob 0ee389557af36e8d030f7fdc724f2185280c4dd4	first.txt
```
So a commit objects refers to a tree object which refers to blob or other sub-tree objects as we will see later.

Now, lets see what happens when we create and commit another file.
```
$ mkdir first-folder
$ echo "Second file" > first-folder/second.txt
$ git add first-folder/second.txt
$ git commit -m "Second commit"
[master 7518b9b] Second commit
 1 file changed, 1 insertion(+)
 create mode 100644 first-folder/second.txt
```
The object folder has 4 new objects (I will use the tree command to better visualize this)
```
$ tree .git/objects
.git/objects
├── 0e
│   └── e389557af36e8d030f7fdc724f2185280c4dd4
├── 20
│   └── d5b672a347112783818b3fc8cc7cd66ade3008
├── 48
│   └── 863b5e1ebfee389ed64e19ec97698c529d17ab
├── 75
│   └── 18b9bd8ef191b814dce26ad8f0d5378dd9eb40
├── 9e
│   └── 6521cb8249bd0f705994d9478390b4b93f00c4
├── ae
│   └── 49862b12d89de7bdc67f6924f7cf8549a8a457
├── e5
│   └── 223bc2e9eb09b0d966642c67059b4b8dda6aea
├── info
└── pack
```
Now when I run the _cat-file_ command on the latest commit here is what I see.
```
$ git cat-file -p 7518b9bd8ef191b814dce26ad8f0d5378dd9eb40

tree 9e6521cb8249bd0f705994d9478390b4b93f00c4
parent 48863b5e1ebfee389ed64e19ec97698c529d17ab
author Thomas <thomas@craftacademy.se> 1562126715 +0200
committer Thomas <thomas@craftacademy.se> 1562126715 +0200

Second commit
```
Apart from having a reference to a tree this commit also has reference to its parent commit.
```
$ git cat-file -p 9e6521cb8249bd0f705994d9478390b4b93f00c4

040000 tree e5223bc2e9eb09b0d966642c67059b4b8dda6aea	first-folder
100644 blob 0ee389557af36e8d030f7fdc724f2185280c4dd4	first.txt
```
On running _cat-file_ on the tree object referred by the second commit we see it contains reference to a blob for _first.txt_(it didn’t change because the contents of the file didn’t change). If we were to modify the contents of _first.txt,_ the blob reference would also be different here. It also contains reference to a tree object because _first-folder_ is a directory and tree objects are used to store references to directories too.


### Packfiles

If you examine the `.git/objects/` folder in any of your projects with an extensive git history, you might find that it is either empty or that it only contain a few objects.

Git has the ability to merge together multiple objects into single files, known as pack files. These are, in essence, multiple objects stored with an efficient delta compression scheme as a single compressed file. You can think of it as akin to a Zip file of multiple objects, which Git can extract efficiently when needed.

What happens is that periodically (or on user demand), Git will run a compression on the loose objects. This is triggered either by a git gc request, or automatically after various thresholds have been met. Git will then create the pack file and remove the loose object files from the `.git/objects` sub-folder.

Run the following command in your `git_internals` project folder:
```
$ git gc
```
If we now examine the `.git/objects` sub-folder, we'll see something like this:
```
$ tree .git/objects/
.git/objects/
├── info
│   └── packs
└── pack
    ├── pack-b39052b2dd0bd8a8886b51edc64cf02b9ea754e2.idx
    └── pack-b39052b2dd0bd8a8886b51edc64cf02b9ea754e2.pack
```
We can now use the `git verify-pack` command:
```
$ git verify-pack -v .git/objects/pack/pack-b39052b2dd0bd8a8886b51edc64cf02b9ea754e2.idx
4277c1f797253dff8ead0afdbecc3611e2db6958 commit 225 150 12
d39f5c2f711968db8d8ea4ddcfc40543207eb5ff commit 173 123 162
0ee389557af36e8d030f7fdc724f2185280c4dd4 blob   13 22 285
aed9093abfbd6ab5603b3c7ed1731690fda48b3c blob   16 26 307
99f3a6ccff743c0ec3bf7d3677da8ef3c656f431 tree   73 82 333
0433624b96ec5cec5d7f1a1cf8dd1c652fc03518 tree   43 54 415
ae49862b12d89de7bdc67f6924f7cf8549a8a457 tree   37 47 469
non delta: 7 objects
.git/objects/pack/pack-b39052b2dd0bd8a8886b51edc64cf02b9ea754e2.pack: ok
```
And now, we can grab a tree and call `git ls-tree` on it:
```
$ git ls-tree 99f3a6ccff743c0ec3bf7d3677da8ef3c656f431
100644 blob 0ee389557af36e8d030f7fdc724f2185280c4dd4	first.txt
040000 tree 0433624b96ec5cec5d7f1a1cf8dd1c652fc03518	my-folder
```
And so on... ;-)