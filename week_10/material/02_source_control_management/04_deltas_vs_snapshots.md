### Some internals...Deltas

A VCS repository contains every version of everything that has ever occurred. Conceptually, many VCSs store information as a list of file-based changes.

A tree is a hierarchy of directories and files. The idea is that tree N is often not very different from tree N-1, because by definition, each version of the tree is derived from its predecessor. A commit might be as simple as a one-line fix to a single file. If all of the other files are unchanged, then we don’t really need to store another copy of them. Instead, we want a way to store a tree in terms of the changes relative to another tree. We call this a **delta**.

A Delta is a list of changes which express the difference between two versions of a tree. This list includes files or directories that have been added, modified, renamed, deleted, or moved.

Deltas are often, but not exclusively, used in Centralized systems

### Snapshots

In Git, while the same underlying facts remain, a different concept is being used. Instead, Git handles information more like **a set of snapshots of a mini filesystem**. On every commit, Git basically takes a picture of what all your files look like at that moment and stores a reference to that snapshot.

That kind of sound like a method that might lead to an enormous consumption of disk space, right? In principle, if we take a snapshot of everything in a project (that might consist of several hundred folders, subfolders, and files), we might probably end up with huge repositories of N TB or more. That would not be practical - neither in short or in the long term.

So, in order to be efficient, if certain files have not changed, Git doesn’t store the file again—just a link to the previous identical file it has already stored. Since only new or the amended files are being stored, disk space is being preserved.

This is an important distinction between Git and nearly all other VCSs, and allows for a more performant functionality (like reverting)