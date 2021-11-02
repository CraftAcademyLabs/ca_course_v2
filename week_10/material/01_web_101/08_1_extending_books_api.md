
We want to extend our Books API and Client with a bit of functionality that will make use of a cookie to store information that we can use to identify a user.

But, first things first. Let's start with adding a new table to our databaste to store user info. We will keep it real simple and give out user ane attribute: `user_name`.

Log in to `psql`, connect to the `books_api` database ans att a table:
```sql
 $ psql -d postgres -U api_user
psql (11.2)
Type "help" for help.

CREATE TABLE users ( 
  ID SERIAL PRIMARY KEY, 
  user_name VARCHAR(255) NOT NULL);
CREATE TABLE
```
With this addition, our database have two tables. We can easily check that in the psql console:
```sql
postgres=> \dt
         List of relations
 Schema | Name  | Type  |  Owner   
--------+-------+-------+----------
 public | books | table | api_user
 public | users | table | api_user
(2 rows)
```
We also need to add an entry to the `users` table:
```sql
INSERT INTO users (user_name) VALUES ('Thomas');
```
And check if the user was saved by querying the table:
```sql
postgres=> SELECT * FROM users;
 id | user_name 
----+-----------
  1 | Thomas
(1 row)
```
Let's shift out focus to our application and modify our current implementation with the following:

1.  Set a cookie every time a request to the backend will be made, with the id of our user (it will be `1` in our case), and call it `uid`. For security reasons, we will used a signed cookie.
2.  Make use of that cookie when we create a new book listing and require its presence before we actually write to the `books` table.

This process is supposed to mimic a sort of authentication flow, where the identity of the user is passed around in the request - response cycle using cookis. Not an uncommon practice.

Chagne the configuration ofthe `app.js` to include `cookie-parser` and add the basic cookie configuration:
```javascript
const cookieParser = require('cookie-parser');
const cookieConfig = {
  maxAge: 1000 * 60 * 15, // would expire after 15 minutes
  httpOnly: true, // The cookie only accessible by the web server
  signed: true // Indicates if the cookie should be signed
};
```
Once your `app` object has been created, tell the application to use the parser:
```javascript
app.use(cookieParser('books_api_secret_12345'));
```
We also need to modify `cors` settings to allow origins where the request can come from. A wildcard (`*`) will NOT be allowed:
```javascript
app.use(cors({
  credentials: true,
  origin: ['http://localhost:3474'] //  the default port that will be used with superstaic server (see comments below)
}))
```
Next, we will have to make sure that the cookie is added to our response in `getBooks`:
```javascript
const getBooks = (request, response, next) => {
  pool.query('SELECT * FROM books', (error, results) => {
    if (error) {
      throw error
    }
    response
      .cookie('uid', '1', cookieConfig)
      .status(200)
      .json(results.rows)
  })
}
```
At this stage, you should access the API using your client. You will see the application loading as usual, and the books being listed. You will NOT, however, see a cookie. Open the Chrome Developer Tools and the `Application` tab (as you see below):

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/P7JdCGrsT6yXoYiCDLrm)

We have to modify the code on the client side to make the cookie persist. Open up that codebase, and navigate to where you have defined your `fetchData()` function. Modify the `fetch` call to include credentials:
```javascript
const fetchData = async () => {
  let data = await (await fetch(apiUrl, { credentials: 'include' })).json()
  return data
}
```
Without credentials, the browser cannot send or receive cookies via `fetch()`. With credentials as same-origin I can see the cookies coming from the server in the Set-Cookie response header, but nothing is being stored in the browser.

So, the solution is to set credentials to `include` to allow cross-origin cookie sending. Just as we did above.

If you restart your Superstatic server, and access this page again, you should see the cookie:

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/KIke2g5QScK0lnydaIhn)

## "authorizing" the user

We will make modifications to the `addBook()` function. They will serve as a simulation of an authorization process by:

1.  Get the value of the `uid` cookie
2.  Fetch a user from the `users` table, using the value stored in the cookie as the identifier.
```javascript
const addBook = (request, response, next) => {
  const { author, title } = request.body
  let uid = request.signedCookies.uid;
  let user
  pool.query('SELECT * FROM users WHERE id = $1', [parseInt(uid)], (error, res) => {
    if (err) {
      response
        .status(401)
        .json({ status: 'error', message: 'Unauthorized access!' })
    } else {
      user = res.rows[0]
      pool.query('INSERT INTO books (author, title) VALUES ($1, $2)', [author, title], error => {
        if (error) {
          throw error
        }
      })
      response
        .status(201)
        .json({ status: 'success', message: `Thank you ${user.user_name}!` })
    }
  })
}
```
This is, of course, not really how you would do it in a real application. It is just a proof of concept that we can, in a way, keep state in a web based application.