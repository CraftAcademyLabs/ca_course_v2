If you examine the terminal output, you’ll see a line like this one.
```
/your/path/atm/spec/atm_spec.rb:1:in `require': cannot load such file -- ./lib/atm.rb (LoadError)
...
```
That means that the spec file can not load `./lib/atm.rb` (where we are supposed to have our implementation code).

Of course not, we haven’t created that file yet. There’s no `lib` folder yet either. Let’s create all that now.
```
$ mkdir lib
$ touch lib/atm.rb
```
Run your spec again.
```
rspec spec/atm_spec.rb
/your/path/atm/spec/atm_spec.rb:2:in `<top (required)>': uninitialized constant Atm (NameError)
```
A new error message. But not the same as before. That is good. So what have we here? `uninitialized constant Atm`? Yes, there is no `Atm` class defined. Let’s do that.