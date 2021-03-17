### ES Modules in browser

You need to serve the folder using a webserver. Use npx serve if you don't have any other server library installed.

You have to use export (ES Modules) and not module.exports (CommonJS) An example:

index.html
```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
</head>
<body>
  <div id="display"></div>
  <script type="module">
    import getGreetingAsAnArrowFunction from './module.js'
    document.addEventListener('DOMContentLoaded', () => {
      let display = document.getElementById('display')
      display.innerHTML = getGreetingAsAnArrowFunction({ name: "Thomas", state: "tired of JS right now..." })
    })
  </script>
</body>
</html>
```
module.js
```javascript
const getGreetingAsAnArrowFunction = args => (
  `Hello ${args['name']}, looks like you are ${args.state}`
)
export default getGreetingAsAnArrowFunction
```
And this should now work if you visit [http://localhost:5000](http://localhost:5000/) .