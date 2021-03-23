
We will start by creating a basic ExpressJS application using the `express-generator-api` scaffolder ([https://github.com/pietgeursen/generator-api](https://github.com/pietgeursen/generator-api)).

Once the scaffold is done, and you have installed all dependencies, your project folder structure should look like this:
```
├── app.js
├── bin
│   └── www
├── package.json
├── routes
│   └── users.js
└── yarn.lock
```
Make sure to take some time to read through the code in `app.js` and `bin/www`. Next, we will take the app for a first spin.

### Execution

Run the following commands in your terminal:
```
$ npx express-generator-api --git  node-api-demo
$ yarn
```
Once your dependencies are installed, we want to start the application:
```
$ yarn start
```
In your browser, navigate to `http://localhost:3000/api/v1/users`. You are making a GET request, and should be able to see the following data:

Where is this data coming from?

At this point, based on the application structure, we hard-code the response in `routes/books.js`. Make sure you take a close look at this file and modify the settings to see them come across in the response you see in the browser.

This is, however, temporary. We will change that.