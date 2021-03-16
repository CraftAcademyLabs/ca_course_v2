Each account that we create should have an owner. The owner should have a class of his own. For the moment that class is not defined so we will go ahead and pretend again that there is an instance of Person by using an `instance_double`.

_spec/account_spec.rb_

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/iWf1EDH0RU2V2prkCbnq)

First, let’s see if the owner is being set.

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/0RAuAjPTe6dT42cMU3P9)

And add a test for a mandatory owner for each instance of Account.

_spec/account_spec.rb_

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/DPihlDXCRiqUihgs3gqw)

Note that we are using a new matcher (`raise_error`). There are many more matchers we can use when writing our tests. Take some time to read through the documentation about [RSpec’s built-in matchers](https://relishapp.com/rspec/rspec-expectations/v/3-4/docs/built-in-matchers/).

Moving on to the implementation to make these two specs to pass (as usual, this is a suggestion, examine the code closely before using it).

_lib/account.rb_

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/jFJjxb3wRH2ELzCx1UAe)