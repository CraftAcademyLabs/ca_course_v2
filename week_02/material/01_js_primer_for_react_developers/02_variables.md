### Variables: `var`, `let`, and `const`

JavaScript has had `var` since the beginning which is related to how JavaScript's scope works.

Scope in JavaScript works a little different from some other languages and sometimes can be hard to manage with the way function scoping works. "Block Scope" can be easier to understand and manage which is why JavaScript got `let`, and `const` in ES2015. Here's a quick rundown of how all three work:
```
// var does not have block scope
var name = 'Thomas'
if (true) {
  var name = 'Oliver'
  name // 'Oliver'
}
name // 'Oliver'

// let has block scope
let name = 'Thomas'
if (true) {
  let name = 'Oliver'
  name // 'Oliver'
}
name // 'Thomas'

// const has block scope too
const name = 'Thomas'
if (true) {
  const name = 'Oliver'
  name // 'Oliver'
}
name // 'Thomas'

// let can be reassigned
let isOpen = true
isOpen = false
isOpen // false

// const cannot be reassigned
const isOpen = true
isOpen = false // throws error

// Although const cannot be reassigned, if the value
// is an array or an object, it's inner parts can be
// changed, as long as the array or object itself isn't
// reassigned
const list = []

// This is allowed because we're not changing the fact
// that list is still the same array. We're just adding
// stuff to it
list.push('Thomas')

// But this is not allowed, we cannot change (reassign)
// list to be something other than the array it started
// off to be
list = 'turn list into a string'
```
We find block scope to make more sense to people and is generally more useful, therefore we don't use `var`.

We use `const` for everything, unless it can be reassigned later, only then do we use `let`. It's a way to let other people know (pun intended) to watch out for that value, because it will likely change over time.

In practice, nearly everything is `const` unless you have specific reasons to use `let`. And while some would say it's controversial, some believe there is no reason to use `var` anymore, that `let` does everything we would possibly need `var` for.

-   [Read more on const](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/const)
-   [Read more on let](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/let)