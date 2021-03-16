Okay, we will stop here for a moment ad do some changes to our code to make it more readable and to follow the principle that each method should only have one responsibility. In our case, the way we have written the `withdraw` method, the method performs several tasks. Since we will be developing that method further, we want to introduce a better, more readable structure.

In practical terms, we want to extract some of this methods responsibilities to separate, so-called `private` methods.

• We want to extract the check of `account.balance` to a separate method.

• We want to extract the transaction to a separate method.

Evaluate this code carefully.

_lib/atm.rb_

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/nbfFk5EkRDeaLyQfpgvM)

Note that we have NOT made any changes to our test and if you run them now, they should all pass green.

**Refactoring is all about that. You make your code better WITHOUT introducing any new functionality.**