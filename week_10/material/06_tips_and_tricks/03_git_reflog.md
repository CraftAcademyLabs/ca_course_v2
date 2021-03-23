
Basically every action you perform inside of Git where data is stored, you can find it inside of the reference log - reflog.

Git tries really hard not to lose your data, so if for some reason you think it has, chances are you can dig it out using git reflog. What this means is that you can use it as a safety net: you shouldn’t be worried that a merge, rebase, or some other action will destroy your work since you can find it again using this command.

The most common usage of this command is that you’ve just done a git reset and moved your HEAD back a few commits. But what if you need that bit of code you left in the second commit? Now what? Running git reflog will give you an overview of ALL actions that you performed and could look something like this:

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/fP5Rrqv0R3O0WiAHxhLg)

Now, if you compare that to the more common git log, you can see that we list far more actions using reflog.

You can also use the --all option to get more detailed information about different branches and even the stash:

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/a5N8AYwOQAaCWGF3U1su)

This command is also used for another purpose: deleting old entries that you won’t need anymore. This may be done to conserve space in your repository, or perhaps since you want to take out the garbage every once in a while. You could knock off individual reflogs using the delete subcommand, but the expire subcommand is much more useful since it can be given a date to remove entries from.
```
git reflog expire --expire=now --all
```