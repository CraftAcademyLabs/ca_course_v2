
Let me put down some ground rules about version control. Commit often, write good commit messages and push up to your GitHub account. That is the only way for us coaches to see your progress. It does not matter if the code is working. We still want to see it. BAD CODE is better then NO CODE!

Next, you need to create a `.gitignore` file. That file is used to keep information about files we want to EXCLUDE from version control.
```
$ touch .gitignore
```
Add at this to that file.

_.gitignore_
```
.DS_Store
```
.DS_Store (Desktop Services Store) is a OSX file that stores custom attributes of its containing folder, such as the position of icons or the choice of a background image. We don’t want to track those files with git.

Now, perform the following steps.
```
$ git add . 
$ git commit -am "<your message>"
$ git push origin master
```