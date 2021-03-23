1.  **git diff** - shows the differences between the last checked in version and files that have been changed, but not had `git add` run on them.
2.  **git diff --cached** - shows the differences between the previous version and what all files that have had `git add` run, but have not been committed
3.  **git diff commitid** - show the differences between the current working directory and a previous commit as specified with the commitid
4.  **git diff commita..commitb** - shows the differences between two commits, a and b. The commits could also be symbolic names like branches or tags.