In cases like these, we want to create a class that will have predefined attributes when we create the classes. We can do that by setting that value in the `initialize` method. `initialize` is a constructor method that will be run every time an instance of a class is created.

_lib/atm.rb_

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/1qyClMvvRZGJLI81BP2o)

And now, when you run RSpec, the test passes.
```
$ rspec spec/atm_spec.rb

Atm
  has 1000$ on initialize

Finished in 0.00195 seconds (files took 0.67858 seconds to load)
1 example, 0 failures
```
Yay! First success! **Green is GOOD!**