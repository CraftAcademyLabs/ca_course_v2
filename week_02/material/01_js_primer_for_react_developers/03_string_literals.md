### String Literals

Strings in JavaScript can made with single or double quotes. But when you make strings this way, you can't have multiline unless you manually add new lines. Template literals (sometimes referred to as Template Strings) allow us to do multiline in a much cleaner way. Template Literals use the back-tick instead of a single or double quote.
```
// Manual hard returns with \\n isn't fun
const str = 'multiline\\nwith\\nmanual\\nhard returns'

// This is much nicer.
const str = `
  multiline
  without
  the
  mess
`
```
Another benefit is string interpolation (making strings from variables)
```
const something = 'ugly stuff'
const str = 'instead of ' + something + ' like this'

const something = 'lovely stuff'
const str = `you can do ${something} like this`
```
In the first example, the `str` is being built with a variable. Notice we have to use `+` concatenation to do so. In the second example, the `str` is a Template Literal which can use `${}` to interpolate variables into the string. Notice that it also doesn't matter how the `something` variable was made, with or without back-ticks.

-   [Read More](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Template_literals)