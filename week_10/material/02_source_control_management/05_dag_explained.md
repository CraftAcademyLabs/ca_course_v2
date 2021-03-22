
## Directed Acyclic Graph

DAG is a directed graph data structure that uses a topological ordering. The sequence can only go from earlier to later. DAG is often applied to problems related to data processing, scheduling, finding the best route in navigation, and data compression.

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/wTNN1TnyRyVVoCAOfPss)

A DAG, like a tree, can be laid out such that all parent-child relationships are one-way. The difference between them is that nodes in a DAG can have multiple parents.

The history in Git is formed from the commit objects; as development advances, branches are created and merged, and the history will create a directed acyclic graph, the DAG, due to the way Git ties a commit to its parent commit. The DAG makes it easy to see the development of a project based on the commits.

By default, `git log` prints the commit, author's name and e-mail ID, timestamp, and the commit message. However, the information isn't very graphical, especially if you want to see branches and merges.

To display this information and limit some of the other data, you can use the following options with git log:
```
$ git log --decorate --graph --oneline --all
```
The command will:

-   show one commit per line (--oneline) identified by its abbreviated commit ID and the commit message subject.
-   draw a graph between the commits depicting their dependency (the `--graph`option).
-   show the branch names after the abbreviated commit id (the `--decorate` option)
-   show all the branches, instead of just the current one (the `--all` option)