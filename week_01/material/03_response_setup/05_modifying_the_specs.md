Well, we have modified the `withdraw` method since we wrote that first spec. The method is now expecting to receive the `account` object, as well as the amount we want to withdraw, as arguments. So we need to modify that spec and add the account as an argument. (See the modified `expect` statement below).

_spec/atm_spec.rb_

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/XGEsxMVYTSSDGYLVMUC1)

Now, everything should go green when you run your tests.