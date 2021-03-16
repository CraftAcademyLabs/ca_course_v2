Another check we need to do in the `withdraw` method, is to test if there are funds in the ATM, right? We can’t perform a transaction if there are no funds in the machine.

As an ATM operator
In order for our costumers to withdraw funds
I need to make sure that we only allow withdrawals if there are funds available

The ATM has a `funds` attribute. We can perform a check if the `amount` we try to withdraw is larger then the `funds` available.

Let’s add a spec for that.

_spec/atmspec.rb__

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/Xbn0eDOxRQqchyN5f84w)

And implement a new when in the withdraw method.

_lib/atm.rb_

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/3n9ByJT3THqezt4jsrVA)

And, we also need to create a new private method, just as we did with the previous example.

_lib/atm.rb_

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/TDo45cZQSS7uTiWv3zHS)