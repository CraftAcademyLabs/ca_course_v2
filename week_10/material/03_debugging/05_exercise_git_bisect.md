
We will take a look a git bisect from a practical perspective. This will be a very simple demo, but should at least show you how this tool can help you to track down erroneous code in your git history. Let's create a new folder (name it `bisect_demo`) and create a series of commits.
```
git init
echo "Space, the final frontier" > monologue.txt
git add ./monologue.txt && git commit -am "first line"
echo "These are the voyages of the Starship Enterprise" >> monologue.txt && git commit -am "second line"
echo "Its five years mission" >> monologue.txt && git commit -am "third line"
echo "To explore strange new worlds" >> monologue.txt && git commit -am "fourth line"
echo "To seek out new life" >> monologue.txt && git commit -am "fifth line"
sed -i -e 's/strange new/well known/g' monologue.txt && git commit -am "modifies fourth line"
echo "And new civilizations" >> monologue.txt && git commit -am "sixth line"
echo "To boldly go where no man has gone before" >> monologue.txt && git commit -am "seventh line"
```
Copy and execute the above code in your terminal. At this point you should have a series of commits and a file that we can work with in this exercise.

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/D4Rrs0TkmuW09cTXJ9Bg)

### Find the bug

Let's take a look at the contents of `monologue.txt`. There is a glaring error: one of the lines of the well-known introduction monologue to the best Sc-Fi series EVER made, the expression "To explore strange new worlds", is not correct. Something happened during our commit history -- at some point, the commit of the words "strange new" was overwritten with the words "well known". That's unacceptable and will, for the sake of our exercise, play the role of our bug.

Let's go hunting!

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/lgQ5nW3rS5bfwcubO3FK)

### The Experiment

Lets use git log to find a good commit, and a bad commit. Good commit it there we know that our "code" worked, and the bad commit, is any commit where the "bug" appears - in this case it will be the HEAD.

Let's try to find a commit that still had the words 'strange new', and not the words 'well known'. Check out your git log (or see screen shot above). We know that the newest commit in the log is bad, so we will classify this as our bad commit. For the sake of simplicity, let's say our good commit is the first commit we made for the line "To explore strange new worlds":

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/ZF0h13aoQRGafN3rkSLB)

Again, we are just scratching the surface of what this tool can do for us. If we take a closer look at the command itself, we can see that there are plenty of other, more advanced, ways to use it.
```
git bisect start [--term-{old,good}=<term> --term-{new,bad}=<term>]
		 [--no-checkout] [<bad> [<good>...]] [--] [<pathspec>...]
	reset bisect state and start bisection.
git bisect (bad|new) [<rev>]
	mark <rev> a known-bad revision/
		a revision after change in a given property.
git bisect (good|old) [<rev>...]
	mark <rev>... known-good revisions/
		revisions before change in a given property.
git bisect terms [--term-good | --term-bad]
	show the terms used for old and new commits (default: bad, good)
git bisect skip [(<rev>|<range>)...]
	mark <rev>... untestable revisions.
git bisect next
	find next bisection to test and check it out.
git bisect reset [<commit>]
	finish bisection search and go back to commit.
git bisect (visualize|view)
	show bisect status in gitk.
git bisect replay <logfile>
	replay bisection log.
git bisect log
	show bisect log.
git bisect run <cmd>...
	use <cmd>... to automatically bisect.
```
Experiment with `git bisect` to make this tool work for you in your own flow.