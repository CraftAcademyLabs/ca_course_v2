The until loop is a variation on the while loop but reverse. ;-)
```
count = 0
until count == 5
  print 'The count is now ', count, '. '
  count = count + 1
end
```
Result: same as previous page.

Pay attention to the double equal signs. In Ruby `a == 5` means “Compare a to 5”, and `a = 5` means “Set the value of a to 5”.

Back to our implementation.

As usual, let’s start with our test. We don’t necessarily need to add any new specs but rather modify the ones we already have written.

Let’s revisit this spec.

_spec/atm_spec.rb_

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/J4WSz57IRJmnzGhVFdPm)

Apart from a slightly updated formatting, we’ve added `bills: [20, 20, 5]` to the `expected_output`.

If you run this spec now, it will go red.

Let’s add `bills:` to the output and create a method that builds upon our experimental code above and populates the array.

_lib/atm.rb_

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/NWrmOoAcSYC66ANMTBhU)

With this we are closing to the end of the line with the Atm class.