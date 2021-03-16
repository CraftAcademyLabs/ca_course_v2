_spec/atm_spec.rb_

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/GKqzELBRteCt3mpFpFq1)

In my spec file that `it` block starts at line 7. What I can do is to run JUST that particular block, instead of the entire spec file. It might seem trivial right now, but further down the road we’ll have dozens of specs and trust me, you don’t want to keep running them all at once.
```
$ rspec spec/atm_spec.rb:7
Run options: include {:locations=>{"./spec/atm_spec.rb"=>[7]}}

Atm
  funds are reduced at withdraw (FAILED - 1)

Failures:

  1) Atm funds are reduced at withdraw
     Failure/Error: subject.withdraw 50

     NoMethodError:
       undefined method `withdraw' for #<Atm:0x007fac30e79378 @balance=1000>
...
```
Shoots! New error. Yes, yes, yes. That’s supposed to happen! ;-)