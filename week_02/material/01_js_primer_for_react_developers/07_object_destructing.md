Object destructuring is a way to take an object and to pull out its internal properties into variables outside of the object:
```
const obj = { x: 1, y: 2 }

// instead of:
const x = obj.x
const y = obj.y

// We can "destructure" the values into ordinary
// variables:
const { x, y } = obj
x // 1
y // 2

// you can use this all over the place, like function
// parameters. Notice how we're passing just one thing
// (an object) into the add function. If the function
// is expecting an argument, it can destructure the
// values right in the parameter list.
function add({ x, y }) {
  return x + y
}
add({ x: 3, y: 4 }) // 7
```
It can be a little confusing at first because now curly-braces are used to make objects and to destructure them depending on context. So how can you tell?
```
// If the curlies are on the right-hand sign of the
// expression (equal sign) then we're making an object
const obj = { x: 1, y: 2 }

// If they're on the left-hand side (or the receiving
// side as with parameters), then it's destructuring:
const { x } = obj
x // 1
```
-   [Read More](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring_assignment#Object_destructuring)