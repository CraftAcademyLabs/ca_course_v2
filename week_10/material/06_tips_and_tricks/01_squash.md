
Add a global "squash" alias from bash: (or Git Bash on Windows)
```
git config --global alias.squash '!f(){ git reset --soft HEAD~${1} && git commit --edit -m"$(git log --format=%B --reverse HEAD..HEAD@{1})"; };f'
```
... or using Windows' Command Prompt:
```
git config --global alias.squash "!f(){ git reset --soft HEAD~${1} && git commit --edit -m\"$(git log --format=%B --reverse HEAD..HEAD@{1})\"; };f"
```
  

Your `~/.gitconfig` should now contain this alias:
```
[alias]
    squash = "!f(){ git reset --soft HEAD~${1} && git commit --edit -m\"$(git log --format=%B --reverse HEAD..HEAD@{1})\"; };f"
```
  
Usage:
``` 
git squash N
```
Which automatically squashes together the last `N` commits, inclusive.