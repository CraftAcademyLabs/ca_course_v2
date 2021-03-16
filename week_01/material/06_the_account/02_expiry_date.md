The expiry date on atm cards (and other credit cards) is generally stored in the format of month/year - like “04/16” that translates to April 2016.

When we set the `:exp_date` we need to make the calculation of today’s date and add a predefined amount of years that we want the card to be valid for (remember that for this exercise, the account symbolizes BOTH a bank account AND an atm card)

Let’s write a test to see if the `:exp_date` is set in `initialize`.

_spec/account_spec.rb_

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/eI5Ge84hR32SddG0Xmio)

So, how can we implement a method to set an expiry date when an account object is created?

First of all, we need to tell the class that the default validity of the card is 5 yrs. To do that, we can set a type of variable called constant with the default value of how many years a new card should be valid for. It can look something like this.

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/CzAjdF2yStuCOfVRBhss)

(I would like you to find out why I use capital letters in the variable name and find out what we mean when we say that you need to avoid Magic Numbers in your code.)

When we set the `:exp_date` value, we can start with today’s date and add the value of the constant and finish off by formatting the date the way we want it. It could look something like this.

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/MJ53WKxqTqqTPP8xZ8dv)

(Do you really need `Account::STANDARD_VALIDITY_YRS`? Perhaps `STANDARD_VALIDITY_YRS` in enough? Try it out…)