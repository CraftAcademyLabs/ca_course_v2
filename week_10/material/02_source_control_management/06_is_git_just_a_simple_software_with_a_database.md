
### How is git storing data in order to keep track of everything?

When you create a git repo, using `git init`, git creates a hidden folder named `.git`. This folder contains all the informations needed for git to work. If you want to remove git from your project, but keep your project files, just delete the `.git` folder.
```
$ tree .
.
├── HEAD
├── config
├── description
├── hooks
│   ├── applypatch-msg.sample
│   ├── commit-msg.sample
│   ├── fsmonitor-watchman.sample
│   ├── post-update.sample
│   ├── pre-applypatch.sample
│   ├── pre-commit.sample
│   ├── pre-push.sample
│   ├── pre-rebase.sample
│   ├── pre-receive.sample
│   ├── prepare-commit-msg.sample
│   └── update.sample
├── info
│   └── exclude
├── objects
│   ├── info
│   └── pack
└── refs
    ├── heads
    └── tags
```
Here is what’s your `.git` folder will look like before your first commit:

#### `HEAD`

We’ll come to this later

#### `config`

This file contains the settings for your repository, here will be written the url of the remote for example, your mail, username, … . Every-time you use ‘git config …’ in the console it ends here.

#### `description`

Used by gitweb (kind of an ancestor of github) to display the description of the repo. By default set to: "Unnamed repository; edit this file 'description' to name the repository."

#### `hooks`

Here is an interesting feature. Git comes with a set of script that you can automatically run at every meaningful git phase. Those scripts, called **hooks**, can be run before or after a `commit/rebase/pull`. The name of the script dictate when to execute it. An example of a useful pre-push hook would be to test that all the styling rules are respected to keep consistency in the remote (the distant repository).

#### `info — exclude`

So you can put the files you don’t want git to deal with in your `.gitignore` file. Well the exclude file is the same except that it won’t be shared. If you don't want to track your custom IDE related config files for example, even though most of the time `.gitignore` is enough.

#### `objects`

As mentioned before, git doesn't store a diff of the contents of your files (deltas). It stores snapshots (the exact content of the files) at the point a commit is made. The `objects` sub-directory is where all the content is stored.

#### `packs`

This sub-directory contains packs with compressed objects. Pacs multiple objects stored with an efficient delta compression scheme as a single compressed file. You can think of it as akin to a Zip file of multiple objects, which Git can extract efficiently when needed. You can tell git to pack your objects using `git gc`