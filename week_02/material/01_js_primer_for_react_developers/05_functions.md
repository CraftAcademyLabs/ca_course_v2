Functions in JavaScript can be created in several ways, each with different tradeoffs. Here are three ways to be aware of:
```
// Function Declaration
function getName() {
  return 'Thomas'
}

// Function Expression
const getName = function() {
  return 'Thomas'
}

// Arrow Function (Which is also an expression)
const getName = () => {
  return 'Thomas'
}
```
Based on the previous section on Declarations and Expressions, it's probably more clear as to why the first two get their names. The Function Expression is an "expression" because the function is being assigned to a value. Technically arrow functions are also expressions but in the industry we usually just refer to them as "arrow functions" and not "arrow function expressions".

The basic tradeoff between function declarations and expressions is that [declarations can be "hoisted"](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/function#Function_declaration_hoisting) and expressions cannot. However, many times hoisting doesn't matter so most developers choose one or the other simply based on personal syntax preference. 

### Arrow Functions are Special

Arrow functions are function expressions with a slightly different syntax. In the example above, you can see that the arrow function looks just like function expression example but without the word function and then with a `=>` fat arrow between the parens and the opening curly-brace.

You may have heard that functions create their own scope in JavaScript. This means JavaScript functions create their own context for `this` which can be problematic if we want a function but without having its own context for `this`. One of the characteristics of an arrow function is that they don't create context so `this` inside the arrow function is the same as the `this` on the outside.

Arrow functions can also be really compact. Look at these two examples that do the exact same thing:
```
const getName = () => {
  return 'Thomas'
}

// Same as above but more compact
const getName = () => 'Thomas'
```
When arrow functions omit their curly-braces, it means we want the thing on the right-hand side of the fat arrow to be the return (without saying `return`). This is called an implicit return.

There are some more subtle details to know about arrow functions like how to return an object literal and how to omit the parenthesis for a single parameter. Read more about those with the reference link below:

-   [Read More](http://bradwestfall.com/articles/dont-get-javascript-es6-arrow-functions)