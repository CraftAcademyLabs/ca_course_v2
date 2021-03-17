Array destructuring works almost the same as Object Destructuring but with square-brackets instead of curly-braces:
```
const arr = ['thomas', 'ochman']
const [first, last] = arr
first // thomas
last // ochman
```
The other difference between them is that objects have property names so those have to be used in the destructuring part. Since array values are numerically ordered and without names, the order that we destructure is tied to what value we get -- in other words, `first` is the first variable in the destructure so it gets the first value of the array.

-   [Read More](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring_assignment#Array_destructuring)

### Property Shorthand

Property Shorthand lets you type less if a property name matches the variable name in an object:
```
// Instead of having to type name twice like this
const name = 'Thomas'
const person = { name: name }

// If the property and the variable are the same you can just
// type it like this and omit the colon and the double word
const person = { name }
```
-   [Read More](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Object_initializer#New_notations_in_ECMAScript_2015)

### ...Spread Syntax

When creating objects or arrays, there is a new way to create properties from the properties of an existing object or array. This is much easier shown in code than explained:
```
// Let's say you have this array
const person = ['Thomas', 'Ochman']

// If you were to add the above array to a new one like this:
const profile = [person, 'developer']

// The end result would be an array in an array like this:
profile // [['Michael', 'Jackson'], 'developer']

profile[0] // this is an array
profile[1] // this is the string 'developer'

// However, if we had made profile like this with ...
const profile = [...person, 'developer']

// Then the end result would be this:
profile // ['Thomas', 'Ochman', 'developer']

// The same concept works with objects
const person = { first: 'Thomas', last: 'Ochman' }
const profile = { ...person, occupation: 'developer' }
profile // { first: 'Thomas', last: 'Ochman', occupation: 'developer' }
```
-   [Read More](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax) 

### ...Rest Syntax

This might look similar to "spread" but the difference is that `...` rest is not used to build objects or arrays, it's used to break then down into pieces. Here's an example of rest while destructuring:
```
const profile = { first: 'Thomas', last: 'Ochman', occupation: 'developer' }
const { occupation, ...rest } = profile
occupation // developer
rest // { first: 'Thomas', last: 'Ochman' }
```
Remember, destructuring is a way to break an object or an array apart into pieces. The above code makes an ordinary string variable called `occupation` through destructuring. The three dots `...` followed by a variable name means we want all the rest of the properties into this `rest` object. Note that `...` can be used while destructuring arrays as well. Also, the variable name doesn't have to be "rest". We could have done `...whatever`.

The next form of rest comes in the form of function parameters:
```
function myFunction(first, last, ...rest) {
  return rest
}

console.log(myFunction('Thomas', 'Ochman', 'Developer', 'Sweden'))
// output: ['Developer', 'Sweden']
```
The function parameters is suggesting that it wants a first and last name as its first two arguments, but anything you pass in after that will all be added to `rest` as an array.

-   [Read More about Rest in Destructuring](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring_assignment)
-   [Read More about Rest in Parameters](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/rest_parameters)