## Difference between optional and standard parameters.

First of all we must know the difference between parameters and arguments:

A parameter is a variable in the method definition. When a method is called, the arguments is the data you pass into the method’s parameters.

To clarify:

Parameter is variable in the declaration of function. The argument is the actual value of this variable that gets passed to function.

Now when the difference between parameters and arguments are clear, lets consider the Car class below.

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:2500/https://www.filepicker.io/api/file/NLZjrQTaumFqeGF2K63Q)

Creating a new Car object means that we need to pass in the arguments `'Toyota'` and `'metallic'` so that a new instance of the car class will be created. like this:
```
2.5.1 :001 > new_car = Car.new('Toyota', 'metallic')
=> #<Car:0x007faf628941f8 @brand="Toyota", @color="metallic">
```
Otherwise we will get the error:

ArgumentError: wrong number of arguments (given 0, expected 2)

Go ahead and try it out in `irb`.

So lets rewrite our `Car` class a little:

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:2500/https://www.filepicker.io/api/file/MYgUPbOjRaSnDanxdCx2)

Now let’s create a new instance of the `Car` class
```
2.5.1 :001 > new_car = Car.new
=> #<Car:0x007faf628941f8 @brand=nil, @color=nil>
```
When we create a new Car object without passing in the arguments we do not get an error, however if we examine the object that is created a little bit closer we can see that the `@brand` and `@color` is `nil`. This means that we do not get the `ArgumentError` and the object is created. But we still have to pass in the arguments in order to set the values.

So what would we do if we want to pass in arguments to the `Car` class? Well because we added the `options = {}` we now need to pass in the arguments in the form of a `key:value` pair
```
2.5.1 :001 > new_car = Car.new(brand: 'Toytota', color: 'metallic')
=> #<Car:0x007faf628941f8 @brand='Toytota', @color='metallic'>
```
We could also pass in just one argument, try this in `irb` and examine the output.

The benefits of using optional parameters are that you do not get an error and that you know which arguments you are passing in.