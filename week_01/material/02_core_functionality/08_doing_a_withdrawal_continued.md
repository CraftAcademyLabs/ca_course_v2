So, we have an `undefined method 'withdraw'`. Alright. Let’s create the `withdraw` method, and let it take one argument - the amount we want to withdraw from the Atm.

_lib/atm.rb_

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/hYR42Z4PSAOLGHiUtwgQ)

Run RSpec to check if you get a different error message.
```
$ rspec spec/atm_spec.rb:7
Run options: include {:locations=>{"./spec/atm_spec.rb"=>[7]}}
Atm
  funds are reduced at withdraw (FAILED - 1)
Failures:
  1) Atm funds are reduced at withdraw
     Failure/Error: expect(subject.funds).to eq 950
       expected: 950
            got: 1000
...
```
Okay, I think you get the point now. We don’t have to follow the error messages in such detail from now on. But remember, you have to keep running your tests after every change you make to your implementation code.

Let’s add some functionality to the `withdraw` method that adjusts the `balance`.

_lib/atm.rb_

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/iXFYNKoIS2WcWKUGy5Wg)

And when you run RSpec again, the test passes. Another one bites the dust!