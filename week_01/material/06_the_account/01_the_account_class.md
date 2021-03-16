Now that we are finished (at least for now) with the `Atm` class, we should move forward and create the `Account` class.
```
As a Customer
In order to manage my funds
I need to have a personal account
```
We will go over the same steps as we did when creating the `Atm` class.

• create a test file (`account_spec.rb`) and

• create a implementation file (`account.rb`)

In the spec file, we’ll be writing our spec for code that we are planning to implement. As usual, there are decisions about what attributes to add to the class and what methods need to be defined.

Fortunately, we already have much of the necessary information about that class to make those decisions easier.

Remember the `class_double` we used while testing the Atm functionality? If we examine that object closely we can see that the attributes we used ware `:pin_code`, `:balance`, `:account_status` and `:exp_date`. At the very least these are the attributes we need to assign to the `Account` class definition.

There is one thing that the `Account` should have, that was never needed in the interaction with `Atm` but that should be a part of it. That is an account owner.

Some tips for testing.

A _PIN_ is generally a 4 digit number. One way to check if a number has 4 digits is this.

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/IFHTTIWeRFOYVQJjmOIC)

Tips: Try running parts of this in IRB if you wonder why the `Math.log10` method can be used for this and why we need to call `.to_i` and `+ 1` on the result.

Also, I would suggest that we randomize the pin code when we initialize a new Account object. A 4 digit number can be randomly generated with:
```
rand(1000..9999)
```