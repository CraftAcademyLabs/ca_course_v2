## Hello World with ExpressJS

Let's create a simple web application and run it on our own computers. For the sake of this exercise, you need to have NodeJS and Yarn installed on your computer. You can check that by executing the following commands in your terminal:
```
$ node -v
v11.10.1

$ yarn -v
1.9.4
```
If you don't have these tools on your machine, it's time to install them now.

the process of setting upp this application is pretty simple. We need to (1) create a folder there we will hold our files, (2) add `express` as a dependency, (3) add a basic configuration for how we want to respond to an incoming request, and finally (4) tell our server what port tto listen on for tthose incoming requests.

Here are the commands we will run, and the code we will add:

In terminal:
```
$ mkdir express_demo
$ cs express_demo
$ yarn init
yarn init v1.9.4
question name (expess_demo): 
question version (1.0.0): 
question description: 
question entry point (index.js): app.js
question repository url: 
question author: 
question license (MIT): 
question private: 
```
(just hit enter through every question except for `question entry point`, where we want to say `app.js`)

Once you are done with that, we want to create a file called `app.js` and open it up in VSCode.
```
$ touch app.js
$ code .
```
In `app.js`, we want to add the following code:
```javascript
const express = require('express')
const app = express()
const port = 3000

app.get('/', (req, res) => {
  console.table(req.query)
  res.send('<h1>Hello Silverspin!</h1>')
})

app.listen(port, () => console.warn(`The audience is listening on port ${port}!`))
```
This app starts a server and listens on port `3000` for connections. The app responds with “Hello Silverspin!” for requests to the root URL (`/`). For every other path, it will respond with a `404 Not Found`.

Back in our terminal, we can execute this code and get the application up and running:
```
$ node app.js
```
Next, open up your browser and navigate to `http://localhost:3000`

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/w0K7zcUFQyy2Ki0SLtRP)

Now, try to send off the following URL: `http://localhost:3000/?param=something&another_param=something%20else`

In your terminal, you should see the following output:

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/GKxXfQaQoO5XHZGhoU8w)

**Now, you have used Query Params!**