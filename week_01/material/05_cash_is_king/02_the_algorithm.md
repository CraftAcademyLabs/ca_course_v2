
Let’s try some stuff out in `irb`. As always, read the comments as carefully as anything else in this documentation.
```
$ irb
```
create an array of denominations. We need to start with the biggest value. Want to know why? Try the other way around for yourself.
```
2.5.1 :001 > denominations = [20, 10, 5]
 => [20, 10, 5]
```
Create an empty array and store it in a variable called `bills`, this object will be populated with our bills.
```
2.5.1 :002 > bills = []
 => []
```
Choose an arbitrary amount - remember that we need to stick to the business objective. The amount needs to be divisible by 5.
```
2.5.1 :003 > amount = 65
 => 65 
```
Here comes the tricky part with the `while` loop. For each value in the `denominations` array, we subtract it from `amount` until amount is lower than zero. At the same time we `push` the value into the `bills` array.
```
2.5.1 :004 > denominations.each do |bill|
2.5.1 :005 >         while amount - bill >= 0
2.5.1 :006?>           amount -= bill
2.5.1 :007?>           bills << bill
2.5.1 :008?>         end
2.5.1 :009?>       bills
2.5.1 :010?>   end
 => [20, 10, 5] 
```
And now, if we check the `bills` array, we can see that there are 4 positions. 3 x 20$ ans 1 x 5$. **Cash is king!**
```
2.5.1 :011 > bills
 => [20, 20, 20, 5] 
```
The same code without my comments and the irb line numbers.

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/wukyarFRGyF21RUsi37Q)

A few words about this type of loops in general and specifically the `while` loop.

A loop is a flow control method that will make code run several times until some condition is met.