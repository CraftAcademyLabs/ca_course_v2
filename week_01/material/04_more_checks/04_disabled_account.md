It is time for you to start to write code on your own. There is yet another one check we need to perform. The `account_status` attribute will tell us if an account is `active` or `disabled`.
```
As an ATM operator             
In order to allow access to active customers             
I want to allow withdrawals from only active accounts
```
Our `instance_double` will be updated with this attribute to look like this.

_spec/atm_spec.rb_

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/kJUqb7OASmeQSqVi7juJ)

**Things to you to consider (in random order)**

• Note that we are using a Symbol rather than a String to set `account_status`.

• You need to write a test for what happens if an account is `:disabled`

• You need to update the output of every test that assumes that withdrawal was successful.

**You are on your own here. If you are unsure on how to proceed make sure to go over the methods we’ve already created. This is a highly repetitive process at the moment. All the answers lies in front of you. ;-) Good luck!**