You can attribute a commit to more than one author by adding one or more `Co-authored-by` trailers to the commit's message.

Before you can add a co-author to a commit, you must know the appropriate email to use for each co-author. To find the email you used to configure Git on your computer, run git config user.email on the command line.

Ensure there are two lines between the end of your commit description and the Co-authored-by: commit trailer.

If you're adding multiple co-authors, give each co-author their own line and `Co-authored-by:` commit trailer.
```
$ git commit -m "Refactor usability tests.
>
>
Co-authored-by: name <name@example.com>
Co-authored-by: another-name <another-name@example.com>"
```