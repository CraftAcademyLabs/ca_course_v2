`while` allows you to specify the condition that must be `true` to keep looping, then the condition is evaluated to `false` the loop exits.

An example:
```
count = 0
while count < 5
  print '- The count is now ', count, '. '
  count = count + 1
end
Result:

- The count is now 0. 
- The count is now 1. 
- The count is now 2. 
- The count is now 3. 
- The count is now 4.
```