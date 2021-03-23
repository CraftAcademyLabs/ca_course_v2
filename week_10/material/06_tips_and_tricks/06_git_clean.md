
Lets say you are working on a branch and, as part of your effort to implement your solution, you create a bunch of files. Rather than deleting the files manually, you can use the **git clean** command.

A prudent thing to do is is to show what will be deleted by using the `-n` option:
```
# Print out the list of files which will be removed (dry run)
git clean -n
```
Clean Step - **beware: this will delete files**:
```
# Delete the files from the repository
git clean -f
```
-   To remove directories, run `git clean -f -d` or `git clean -fd`
-   To remove ignored files, run `git clean -f -X` or `git clean -fX`
-   To remove ignored and non-ignored files, run `git clean -f -x` or `git clean -fx`

**Note** the case difference on the `X` for the two latter commands.

If `clean.requireForce` is set to "true" (the default) in your configuration, one needs to specify the force flag `-f`, otherwise nothing will actually happen.

### Options

-   `**-f**`**,** `**--force**` - If the Git configuration variable clean.requireForce is not set to false, git clean will refuse to run unless given `-f`, `-n` or `-i`.
-   `**-x**` - Don’t use the standard ignore rules read from .gitignore (per directory) and `$GIT_DIR/info/exclude`, but do still use the ignore rules given with `-e` options. This allows removing all untracked files, including build products. This can be used (possibly in conjunction with git reset) to create a pristine working directory to test a clean build.
-   `**-X**` -Remove only files ignored by Git. This may be useful to rebuild everything from scratch, but keep manually created files.
-   `**-n**`**,** `**-dry-run**` - Don’t actually remove anything, just show what would be done.
-   `**-d**` - Remove untracked directories in addition to untracked files. If an untracked directory is managed by a different Git repository, it is not removed by default. Use `-f` option twice if you really want to remove such a directory.