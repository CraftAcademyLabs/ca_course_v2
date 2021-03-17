Here are some common array methods and functions to be familiar with:   

### `Array.isArray()`
```
// Check to see if a value is an array
const myArray = ['hello']
console.log(Array.isArray(myArray)) // true
```

### `.map()`

Map takes an array, iterates over it with a function and whatever the function returns will be the replacement value for the item we're currently on:
```
const myArray = [1, 2, 3, 4]
const result = myArray.map(function(item) {
  return item + 5
})
console.log(result) // [6, 7, 8, 9]

// The above could have also been written like this with
// an arrow function:
const result = myArray.map(item => item + 5)
```  

### `.reduce()`

Reduce is similar to `.map` in that it iterates over an array but the end result is just one value instead of replacing all the values in the array:
```
// Let's add up all the values to get one value of 10
const myArray = [1, 2, 3, 4]
const total = myArray.reduce(function(tally, current) {
  return tally + current
}, 0)
console.log(total) // 10
```
The callback function will give us two important arguments. The first is a running tally of what we've made so far. The second is the current item we're iterating over (in our case the numbers). So, you can see that we're just taking what we have so far and adding each number to it. The only problem is we need tally to start off as `0` otherwise the first iteration won't know how to add things. That's where the second argument for `reduce()` comes in -- the first being the function and the second being a starting value for the "accumulator" which we're calling `tally`

The above could have also been written as an arrow function:
```
const total = myArray.reduce((tally, current) => tally + current, 0)
```

### `.filter`

Filter gives us a new array with the same values, but only if the iterator function returns `true`:
```
const myArray = [1, 2, 3, 4]
const result = myArray.filter(function(item) {
  const isBiggerThanTwo = item > 2
  return isBiggerThanTwo
})
console.log(result) // [3, 4]
```
This example clearly shows that we need to return a boolean based on if the input number is bigger than two. This can be simplified into an arrow function with an implicit return.
```
// As an arrow function
const result = myArray.filter(item => item > 2)
console.log(result) // [3, 4]
```   

### `.find`

Find is similar to Filter but instead of returning an array, only the first item to get true returned from the iterator function is returned from Find:
```
const people = [{ id: 3, name: 'Michael'}, {id: 5 name: 'Bruce' }]
const person = people.find(item => item.id === 3)
console.log(person) // { id: 3, name: 'Michael'}
```