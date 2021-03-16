Let’s define an `instance_double` in our spec and give it a name of `account`. We’ll give our `account` a `@balance` of `100`. Then we’ll be able to use this in our testing.

_spec/atm_spec.rb_

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/DwuhffgRbC0YRVHnsdLt)

Okay, we want the `withdraw` method to have access to the `account` object to know things about it. Things like a `balance` for instance, right?

**The ATM needs to know if there are enough funds in the account before it clears the transaction.**