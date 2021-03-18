
As you were hinted about, the hand holding had an end and we have reached it…

### The actual challenge!

You are challenge with implementing a restriction in your API. Only authenticated users should be able to `create` and `edit` articles. We also want you to write a request spec for the functionality to `register` a user. That functionality is already there, so your challenge is only to write a test, to get even deeper understanding of the functionality we get from `devise token auth`.

#### Weekend checklist

-   Write registration spec
-   Restrict that only authenticated users can create articles
-   Restrict that only authenticated users can edit articles

#### Learning Objectives

-   Practise to read official documentation regarding a gem/package
-   Practise to use a package and put it into practise for the purposes you need it for
-   Keep working with Rails to get more familiar with the framework

#### Tips and Tricks!

This is a difficult challenge and because of that we will give you the solution to send in the users authentication token with the headers in test environment in RSpec.

This is what you need to pass in in order to authenticate the user:

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/oQMBT5cBQPiq4WjN2Bat)

Also, think about the **sad path** when solving this challenge because there the restriction lies. Someone who is not authenticated should be met with an error message and not be able to create or edit an article.