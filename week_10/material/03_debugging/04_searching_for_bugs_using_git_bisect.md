`git bisect` is a tool that allows you to find an offending commit. Let’s say you’ve come across a bug in your codebase and you’re unsure of when it was introduced. If you can find a commit where the code works properly and a commit where it doesn’t, you don’t have to trace down the offending commit by hand; git-bisect will do that for you.

Let’s say you’ve come across a bug in your codebase and you’re unsure of when it was introduced. The slowest, most tedious way of finding a bad git commit is to checkout a commit in history, make sure the broken code isn't there, then checkout a slightly newer commit, check again, and repeat over and over until you find the flawed code.

The good news is that you don’t have to trace down the offending commit by hand, git bisect is a tool that will do that for you. It's like a little wizard that walks you through recent commits, asks you if they are good or bad, and narrows down the broken commit.

How does it work? The idea behind git bisect is to perform a binary search in the history to find a particular regression.

Git bisect is like a wizard: it guides you step by step through a process of elimination until you find the commit that broke your code. Once you type git bisect start, you have started the wizard and it won’t end until you type git bisect reset.

"Binary search" is an algorithm designed to find a target value in a sorted list of values. It works by comparing the target value to the middle element of the list. If they do not match, half of the list has been eliminated (because the list was already sorted) and the process repeats by comparing the target value to the new middle element, and so on, until the target value is found.

Common commands

-   `git bisect start` - start, either of below will do it so it's unnecessary
-   `git bisect bad` - mark current commit bad and jump to next one
-   `git bisect good` - mark current commit ok and jump
-   `git bisect reset` - start over