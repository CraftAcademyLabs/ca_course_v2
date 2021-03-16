The next check will be to make sure that the user passes in the right pin code when trying to withdraw money from his account - just as in normal life.
```
As a Customer              
To keep my funds secure             
I want a secure Pin code & an expiry date on my card that allows only me access to my funds
```
We will need to modify the `withdraw` to accept a `pin_code` at one of the arguments. This will affect all our tests.

_lib/atm.rb_

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/V8fxzwo1SkSHqBVkxgyh)

So, after that change, most of the tests will fail.

Change every call to the `withdraw` method to include `1234` as the second argument.

_spec/atm_spec.rb_

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/930iSgdHQKqDOCQ5Pd9h)

We also need to change our `instance_double` we are using for `account`.

_spec/atm_spec.rb_

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/kXLXhvQORLWVJR4xt2s5)

Okay, make sure that all the tests you have written up until now are passing before you move on.

Next, introduce this test.

_spec/atm_spec.rb_

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/fJdRgrTkqUJzbGbUoUGA)

And implement a new when in the withdraw method.

_lib/atm.rb_

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/qumKcxniTB6P8W4NTMJX)

And again, we need to create a new private method, just as we did with the previous example.

_lib/atm.rb_

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/ZfMWnikGQ7mEvOlcDJ3b)