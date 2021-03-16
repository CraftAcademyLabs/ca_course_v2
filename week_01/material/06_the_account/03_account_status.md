Another check that the Atm does on the Account is to check the `:account_status`. That will be the next thing we implement in the class.

We start with a spec.

_spec/account_spec.rb_

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/FGLdZdxRQG6c8oC1aBzq)

Notice that we are using the datatype Symbol to set the `:account_status`.

And again we need to set that attribute in our `initialize` method.

_lib/account.rb_

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/JMN4XBSbSm6A6MHDUJDu)

Okay, so an account has the status of `:active` when it is instantiated (created). But how about if we would like to deactivate an account. We could simply set the value of the `:account_status` attribute to `:deactivated`. But we can (and should) create a method for that. The question is if we should create a **Class method** or an **Instance method**. You need to research the difference between this type of methods but consider these two different approaches.

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/8Q0tdY6oTO2l5lmaQ1lQ)

Examine the two following ways of using the methods above.

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/eF5iacZtRuPbWhf2ja1d)

Use the one that you find best in your implementation but please be ready to make an argument about your choice.