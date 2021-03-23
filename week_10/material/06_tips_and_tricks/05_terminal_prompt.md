
When you work with git and version control it is a good idea to set up your prompt that displays some useful information such as:

-   What branch are you currently on
-   What is your current status compared to your GitHub repository (`origin`)

There is a very nice modification made available on GitHub called [Bash Git Prompt](https://github.com/magicmonty/bash-git-prompt). You can install it using Homebrew with these steps:
```
$ brew install bash-git-prompt
```
Once the installation is complete, you need to open the `.bash_profile` file:
```
$ code ~/.bash_profile
```
Now add the following configuration at the bottom of the file (do not delete the lines we added above) and save.
```
# ~/.bash_profile

if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
    export __GIT_PROMPT_DIR="$(brew --prefix bash-git-prompt)/share/"
    source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi
```
Once you save and close `.bash_profile`, you can close the text editor and go back to your terminal and reload the file to make the changes you've made visible.:
```
source ~/.bash_profile
```
Your terminal prompt will now show a lot more useful information that will help you in your coding.


## Prompt Structure

By default, the general appearance of the prompt is::
```
(<branch> <upstream branch> <branch tracking>|<local status>)
```
The symbols are as follows:

**Local Status Symbols**

-   `✔`: repository clean
-   `●n`: there are `n` staged files
-   `✖n`: there are `n` files with merge conflicts
-   `✖-n`: there are `n` staged files waiting for removal
-   `✚n`: there are `n` changed but _unstaged_ files
-   `…n`: there are `n` untracked files
-   `⚑n`: there are `n` stash entries

**Upstream branch**

-   Shows the remote tracking branch
-   Disabled by default
-   Enable by setting GIT_PROMPT_SHOW_UPSTREAM=1

**Branch Tracking Symbols**

-   `↑n`: ahead of remote by `n` commits
-   `↓n`: behind remote by `n` commits
-   `↓m↑n`: branches diverged, other by `m` commits, yours by `n` commits
-   `L`: local branch, not remotely tracked

**Branch Symbol:**

-   When the branch name starts with a colon `:`, it means it's actually a hash,