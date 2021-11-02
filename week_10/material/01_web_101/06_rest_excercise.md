
We'll create a local, simple **RESTful API** in **Node.js** that runs on an **ExpressJS** server and utilizes **PostgreSQL** for a database. Then we'll deploy it to **Heroku** - a Platform As A Service (PaaS) in the cloud.

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/4rK6PXJmQmWBwBmVBB62)

Moving on...

### Set Up PostgreSQL Database

We're going to:

-   Install PostgreSQL
-   Create a user
-   Create a database, table, and add entries to the table

Install and start PostgreSQL.
```
$ brew install postgresql
$ brew services start postgresql
```
We will login to `postgres` console as **root user** in order to create a user and give them create database access.
```
$ psql postgres
postgres=# CREATE ROLE api_user WITH LOGIN PASSWORD 'password';
postgres=# ALTER ROLE api_user CREATEDB;
```
Next, we want log out of the **root user** and log in to the newly created user (`api_user`).
```
postgres=# \q
psql -d postgres -U api_user
```
Create a `books_api` database and connect to it.
```
postgres=# CREATE DATABASE books_api;
postgres=> \c books_api
```
Create a `books` table with `ID`, `author`, and `title`.
```sql
CREATE TABLE books (
  ID SERIAL PRIMARY KEY,
  author VARCHAR(255) NOT NULL,
  title VARCHAR(255) NOT NULL
);
```
Insert some entries into the new table.
```sql
INSERT INTO books (author, title)
VALUES  ('J.K. Rowling', 'Harry Potter');

INSERT INTO books (author, title)
VALUES  ('A. Lindgren', 'The Adventures of Pippi Longstocking');
```
--

## Create Express API

The Express API will set up an Express server and route to two endpoints, `GET` and `POST`.

Initiate a new app using Yarn and create the following files:

-   `.env` - file containing environment variables (does not get version controlled)
-   `package.json` - information about the project and dependencies
-   `init.sql` - file to initialize PostgreSQL table (**OPTIONAL. Only used if we deploy this app to a remote server.**  )
-   `config.js` - will create the database connection
-   `app.js` - the Express server
```
$ yarn init
# make sure to set `app.js` as the entry point
$ touch .env init.sql config.js app.js
```
### Environment variables

Set your database user, password, host, port, and database name.

**.env**
```
DB_USER=api_user
DB_PASSWORD=password
DB_HOST=localhost
DB_PORT=5432
DB_DATABASE=books_api
```
### Database initialization

Create a file for initializing the table with an entry. We'll use this for the Heroku database (see section below). The commands are exactly the same as we used to manually create the db and populate the `books` table from the `postgres` console.

**init.sql**
```sql
CREATE TABLE books (
  ID SERIAL PRIMARY KEY,
  author VARCHAR(255) NOT NULL,
  title VARCHAR(255) NOT NULL
);

INSERT INTO books (author, title)
VALUES  ('J.K. Rowling', 'Harry Potter');
INSERT INTO books (author, title)
VALUES  ('A. Lindgren', 'The Adventures of Pippi Longstocking');
```
### Set up PostgreSQL connection

Use the [node-postgres](https://www.npmjs.com/package/pg) package to create a [Pool](https://node-postgres.com/api/pool), which will be used to make queries to the database.

Create a connection string that follows the pattern of `postgresql://USER:PASSWORD@HOST:PORT/DATABASE`. I'll use the environment variables from `.env` using `process.env.VARIABLE`. Initializing with `require('dotenv').config()` will allow you to use those environment variables.

I've also created an `isProduction` string - in an environment like Heroku, `NODE_ENV` will be set to `production` so you can have different behavior between environments. Heroku will supply us with a string called `DATABASE_URL` for the connectionString, so we won't have to build a new one.

**config.js**
```javascript
require('dotenv').config()

const { Pool } = require('pg')
const isProduction = process.env.NODE_ENV === 'production'

const user = process.env.DB_USER
const password = process.env.DB_PASSWORD
const host = process.env.DB_HOST
const port = process.env.DB_PORT
const database = process.env.DB_DATABASE

const connectionString = `postgres://${user}:${password}@${host}:${port}/${database}`

const pool = new Pool({
  connectionString: isProduction ? process.env.DATABASE_URL : connectionString,
  ssl: isProduction,
})

module.exports = pool
```
## Test the connectivity

Once we have set up the db connection and the db is created and populated with the 2 books, we want to test the connection in the node console.

I your terminal, open the node console like this:
```
$ node
Welcome to Node.js v13.1.0.
Type ".help" for more information.
>
```
Then we want to load the db configuration:
```js
> const pool = require('./config.js')
undefined
```
We also want to take a closer look at what `pool` is:
```js
> pool
BoundPool {
  _events: [Object: null prototype] {},
  _eventsCount: 0,
  _maxListeners: undefined,
  options: {
    connectionString: 'postgresql://api_user:password@localhost:5432/books_api',
    ssl: false,
    max: 10,
    idleTimeoutMillis: 10000
  },
  log: [Function (anonymous)],
  Client: [Function: Client] { Query: [Function: Query] },
  Promise: [Function: Promise],
  _clients: [],
  _idle: [],
  _pendingQueue: [],
  _endCallback: undefined,
  ending: false,
  ended: false
}
```
We now want to query the db for all rows in the `books` table:
```js
> pool.query('SELECT * FROM books', (error, results) => { error ? console.log(error) : console.table(results.rows) })
undefined
> ┌─────────┬────┬────────────────┬────────────────────────────────────────┐
│ (index) │ id │     author     │                 title                  │
├─────────┼────┼────────────────┼────────────────────────────────────────┤
│    0    │ 1  │ 'J.K. Rowling' │             'Harry Potter'             │
│    1    │ 2  │ 'A. Lindgren'  │ 'The Adventures of Pippi Longstocking' │
└─────────┴────┴────────────────┴────────────────────────────────────────┘
```
Now, IF there is an error, you will NOT see the table, but rather the error message.

### Write to the DB

In order to be able to create an instance of a book in our code, we want to experiment with some SQL in our `node` console.

Once again, open your terminal and open up the console:
```js
$ node
Welcome to Node.js v13.1.0.
Type ".help" for more information.
> const { pool } = require('./config.js')
undefined
```
Now, that we have the `pool` available, we can try to use the `INSERT` command and write a new book in out table. Execute this JavaScript code in you console.
```js
> pool.query('INSERT INTO books (author, title) VALUES ($1, $2)', ['T. Ochman', 'Getting Started With NodeJS'], error => {})
```
If we now query the database for all books, we should see a new row.
```js
> pool.query('SELECT * FROM books', (error, results) => { error ? console.log(error) : console.table(results.rows) })
undefined
> ┌─────────┬────┬────────────────┬────────────────────────────────────────┐
│ (index) │ id │     author     │                 title                  │
├─────────┼────┼────────────────┼────────────────────────────────────────┤
│    0    │ 1  │ 'J.K. Rowling' │             'Harry Potter'             │
│    1    │ 2  │ 'A. Lindgren'  │ 'The Adventures of Pippi Longstocking' │
│    2    │ 3  │  'T. Ochman'   │     'Getting Started With NodeJS'      │
└─────────┴────┴────────────────┴────────────────────────────────────────┘
```
### Set up Express application

Next, we will create our endpoints. We will only set up enpoints for listing a collection of books (a `GET`request) and creating a new book (a `POST` request).

**index.js**
```javascript
const express = require('express')
const cors = require('cors')
const { pool } = require('./config')

const app = express()

app
  .use(express.json())
  .use(express.urlencoded({ extended: true }))
  .use(cors({ credentials: true, origin: ["http://localhost:3474"] }));

const getBooks = (request, response) => {
  pool.query('SELECT * FROM books', (error, results) => {
    if (error) {
      throw error
    }
    response.status(200).json(results.rows)
  })
}

const addBook = (request, response) => {
  const { author, title } = request.body

  pool.query('INSERT INTO books (author, title) VALUES ($1, $2)', [author, title], error => {
    if (error) {
      throw error
    }
    response.status(201).json({ status: 'success', message: 'Book added.' })
  })
}

app
  .route('/books')
  .get(getBooks)
  .post(addBook)

// Start server
app.listen(process.env.PORT || 3002, () => {
  console.log(`Server listening`)
})
```
### Dependencies

The `package.json` file will list your dependencies/devDependencies and other information.

-   [express](https://www.npmjs.com/package/express) - web server framework
-   [pg](https://www.npmjs.com/package/pg) - PostgreSQL client for Node
-   [dotenv](https://www.npmjs.com/package/dotenv) - allows you to load environment variables from `.env` file
-   [cors](https://www.npmjs.com/package/cors) - enable [CORS](https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS)

We'll also install [nodemon](https://www.npmjs.com/package/nodemon) for development, which automatically restarts the server every time you make a change.

Don't forget to include the `engines` property for Node version.

**package.json**
```json
{
  "name": "books-api",
  "version": "1.0.0",
  "private": true,
  "description": "Books API",
  "main": "app.js",
  "engines": {
    "node": "11.x"
  },
  "scripts": {
    "start": "node app.js",
    "start:dev": "nodemon app.js",
  }
}
```
Now you just need to install all the dependencies.
```
$ yarn add cors dotenv express pg
$ yarn add -D nodemon
```
Everything is set up, so you can run `npm start`, to start the server once, or `npm run start:dev` to restart the server after every change.
```
$ yarn start:dev
```
## Deploy App to Heroku

Now we have everything working locally, so we can create a Heroku account, install Heroku CLI, and set up the app server and database server.

### Set up Heroku CLI and app

Go to [Heroku](https://heroku.com/) and create an account.

Install Heroku CLI.
```
$ brew install heroku/brew/heroku
```
Login to Heroku CLI. This will open a browser window, which you can use to log in.
```
$ heroku login
```
Create your application.
```
# this can be whatever you want, but must be unique
$ heroku create pg-node-api
Creating app... done, ⬢ example-node-api
https://<example-node-api>.herokuapp.com/ | https://git.heroku.com/<example-node-api>.git
```
If you don't pass in an application name, Heroku will provide a random one for you.
```
$ heroku create # generates random name
```
### Set up Heroku Postgres

Go to [Heroku Add-ons](https://elements.heroku.com/addons) and select [Heroku Postgres](https://elements.heroku.com/addons/heroku-postgresql). Click on "Install Heroku Postgres". Click "Apply to app".

It might take up to 5 minutes to propagate. Once that time passes, check to see if your add-on exists via Heroku CLI.
```
$ heroku addons
pg-node-api  postgresql-whatever-00000  heroku-postgresql:hobby-dev  free   created
```
You'll see your new PostgreSQL instance as some auto-generated name like `postgresql-whatever-00000`.

Log into the Heroku PostgreSQL instance.
```
$ heroku pg:psql postgresql-whatever-00000 --app pg-node-api
```
From the root of the project where you have `init.sql`, run the following command to create your table and entries on Heroku Postgres.
```
$ cat init.sql | heroku pg:psql postgresql-whatever-00000 --app example-node-api
```
### Test and deploy

At this point, everything should be set up and ready to go for Heroku. You can test this by running the following command:
```
heroku local web
```
With this, you can go to `http://localhost:5000/books` and see what your app will look like on Heroku.

Since we are returning a collection of books when making a `GET` request, you should see the following output in your browser:
```json
[
   {
      "id": 14,
      "author": "J.K. Rowling",
      "title": "Harry Potter"
   },
   {
      "id": 15,
      "author": "A. Lindgren",
      "title": "The Adventures of Pippi Longstocking"
   }
]
```
If everything looks good, add, commit, and push to Heroku.
```
$ git add .
$ git commit -m "init"
$ git push heroku master
-----> Launching... done
       http://<pg-node-api>.herokuapp.com deployed to Heroku
```
Now, you can try to access your api using postman or a web client.

### The client.

This is a simple web client that will access the api. You should create a new project folder and place the following files in it:
```html
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Books API Demo</title>
  <link rel="stylesheet" href="style.css">
</head>

<body>
  <section id="header">
    <h1>My Book Store</h1>
  </section>
  <div id="display"></div>

  <form onsubmit="submitHandler()">
    <input type="text" name="author" placeholder="Author">
    <input type="text" name="title" placeholder="Title">
    <input type="submit" value="Create">
  </form>
  <section id="footer"></section>
  <script src="app.js"></script>

</body>

</html>
```
And the JavaScript part in `app.js`:
```javascript
const apiUrl = 'http://localhost:3002/books'

const fetchData = async () => {
  let data = await (await fetch(apiUrl)).json()
  return data
}


const displayBooks = () => {
  let displayElement = document.getElementById('display')
  displayElement.innerHTML = ''
  fetchData().then((books) => {
    books.forEach(book => {
      const showDisplayElement = document.createElement('div')
      let html = `<p>${book.title} by ${book.author}</p>`

      showDisplayElement.innerHTML = html
      displayElement.appendChild(showDisplayElement)
    })
  })
}
const submitHandler = async () => {
  event.preventDefault()
  fetch('http://localhost:3002/books', {
    method: 'POST',
    headers: {
      'Accept': 'application/json',
      'Content-type': 'application/json',
    },
    body: JSON.stringify({author: event.target.author.value, title: event.target.title.value})
  }).then((resp)=>{
    console.log(resp.json())
  })
}

document.addEventListener('DOMContentLoaded', () => {
  displayBooks()
})
```
And, finally, a little bit od CSS tn `style.css`
```css
@import url('https://fonts.googleapis.com/css?family=Raleway&display=swap');

body {
  margin: 0;
  font-family: 'Raleway', sans-serif;
}
#header, #footer {
  background:  brown;
  height: 3em;
  font-size: 20px;
  padding: 10px;
}

#footer {
  position: absolute;
  bottom: 0;
  width: 100vW;
}

#display, form {
  padding: 20px;
}

input[type=text] {
  padding: 12px 20px;
  margin: 8px 0;
  box-sizing: border-box;
}

input[type=submit], button {
  background-color: brown;
  color: white;
  padding: 11px 40px;
  font-size: 14px;
}
```
You can open the `index.html` file in your browser using this terminal command:
```
$ open index.html
```
![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/jGuhrQYRHWFJBXTEnXdr)