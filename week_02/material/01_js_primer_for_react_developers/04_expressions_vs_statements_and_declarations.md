
Most code in JavaScript is said to be either an [Expression (Operator)](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Expressions_and_Operators) or [Declaration/Statement](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements). It's not so important to memorize every last detail about these when you're starting off, but it is important to know about expressions for React and to start thinking in terms of expressions.

The brief definition is: Expressions resolve to a single value.
```
// If we're thinking in terms of statements, we might
// write code like this, with an If-Statement:
let result = null
if (someCondition) {
  result = 'Thomas'
} else {
  result = 'Oliver'
}

// Here's how we might the same logic using a
// ternary operator, which is a type of expression
// because the line of code resolves to a single
// value for result
const result = someCondition ? 'Thomas' : 'Oliver'
```
Even though we can often times write code in several different ways, the reason why it's good to start thinking in terms of expressions is that JSX lets you easily use expressions within it, but not statements.

Here's another example of how to think in expressions. First consider this code:
```
const name = 'thomas ochman'
const parts = name.split(' ') // parts: ['thomas', 'jackson']
let first = parts[0] // first: 'thomas'
first = first.toUpperCase() // first: 'THOMAS'
```
Even though these are all expressions, JavaScript lets us combine and chain expressions together. In effect, all the expressions above can be rewritten into one expression:
```
const name = 'thomas ochman'
const first = name.split(' ')[0].toUpperCase()

// We could have even done this:
const first = 'thomas ochman'.split(' ')[0].toUpperCase()
```
Chaining expressions looks funny at first, but if you read it left to right, each part is resolving to a value and then making itself available to the next part. When we do `name.split(' ')`, this resolves to an array, which means the next part can pick off the 0 index with `[0]`. That resolves to a string value of `'thomas'` which can then have a string method added to it like `.toUpperCase()`. Whatever the far right side of the expression resolves to gets returned to the left-hand side of the equal sign, in our case a variable called `first`.