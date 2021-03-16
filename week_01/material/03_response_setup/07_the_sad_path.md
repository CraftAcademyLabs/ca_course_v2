Okay, so now we can do a withdrawal **IF** there is money in the account.

Let’s start thinking about everything that can go wrong with a withdrawal.

For starters, what if there is not enough money in the account? At this point we only `return` from the method without any feedback for the user.

Let’s change that.

_spec/atm_spec.rb_

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/VHwvuL0SV2RjFBEo85ei)

This test should fail for you. The following implementation is needed.

_lib/atm.rb_

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/x2pOhSdTmyrV5vTuftXw)