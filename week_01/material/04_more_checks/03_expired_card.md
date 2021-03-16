Let’s tackle the check for card expiration date.

First, let’s modify our `double`.

_spec/atm_spec.rb_

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/AG5lDGinSJuSBSzAx2rO)

And, as always, we write a test. (I will not include comments. By now you know what we need to do to build a test)

_spec/atm_spec.rb_

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/EJjf3GpTSo6pYGnYdZsk)

And again, we need to modify the `withdraw` method.

_lib/atm.rb_

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/lkui7AKdRCSSZSWDryIZ)

Now, the method `card_expired?` is a little tricky. We need to make use of Ruby’s `Date` object. `account.exp_date` is of String class. We need to transform it into a Date object and compare it to today’s date. Examine the following implementation closely before implementing it.

_lib/atm.rb_

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/NMpGmQHYTuZ57jjrw3o6)

Can you understand what we are doing here?