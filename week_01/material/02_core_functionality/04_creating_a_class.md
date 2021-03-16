In the file lib/atm.rb add the following code:

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/BEHZZLtSSWrjw3I37WQI)

Let’s have another go at the spec.
```
$ rspec spec/atm_spec.rb

Atm
  has 1000$ on initialize (FAILED - 1)

Failures:

  1) Atm has 1000$ on initialize
     Failure/Error: expect(subject.funds).to eq 1000

     NoMethodError:
       undefined method `funds' for #<Atm:0x007f8043fdf2a8>
```
New error message? **Cool**!

Yes, there is no method `funds` for the `Atm` class. Let’s add that by adding an `attr_accessor :funds` to the class. What is `attr_accessor`? You can read about it in this [Stack Overflow answer](https://stackoverflow.com/questions/5046831/why-use-rubys-attr-accessor-attr-reader-and-attr-writer/5046915#5046915).

  

_lib/atm.rb_

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/i8kPEomS06rbYHDGx7Xw)

Another go at the spec and another error message.
```
$ rspec spec/atm_spec.rb

Atm
  has 1000$ on initialize (FAILED - 1)

Failures:

  1) Atm has 1000$ on initialize
     Failure/Error: expect(subject.funds).to eq 1000

       expected: 1000
            got: nil
```
Okay, so we expected funds to be 1000 but it was nil.

Let’s make it so that every time an ATM object is instantiated the balance is automatically set to 1000.