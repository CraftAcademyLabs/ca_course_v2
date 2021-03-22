
We will modify our `books_api` to send out messages using web sockets. The functionality we want to add is the following:

1.  Set up a WebSocket server
2.  Monitor incoming connections and messages
3.  Send out a message whenever a book is added to our database

First, we need to add the `ws` package as a dependency to our application.
```
$ yarn add ws
```
Then, we want to create a file where we will store our WebSocket configuration. We will create a `wsConfig.js` file and add the following code:
```javascript
const WebSocket = require('ws');
const wss = new WebSocket.Server({ port: 8080 });

wss.on('connection', function connection(ws, req) {
  ws.on('message', function incoming(message) {
    console.log(`Received: ${message}`); // this will output the incoming message in logs
  });
  ws.send(`You are connected`); // this will send a message whenewer a new client connects
});

module.exports = { wss, WebSocket }
```
And modify the code in `app.js` to include the `wss` object and send out a message whenever a book is added to the database.
```javascript
const { wss, WebSocket } = require('./wsConfig')

We want to tap into all clients connected to our WS server and send out a message if the connection is in an `OPEN` state. We want to add the following code to the `addBook()` function.

wss.clients.forEach(function each(client) {
  if (client.readyState === WebSocket.OPEN) {
    client.send(JSON.stringify({status: 'success', message: `${user.user_name} just added a book!`}));
  }
});
```
All in all, we want out `addBook()` function to look like this:
```javascript
const addBook = (request, response, next) => {
  const { author, title } = request.body

  let uid = request.signedCookies.uid;
  let user
  pool.query('SELECT * FROM users WHERE id = $1', [parseInt(uid)], (err, res) => {
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
      wss.clients.forEach(client => {
        if (client.readyState === WebSocket.OPEN) {
          client.send(
            JSON.stringify({
              status: 'success',
              message: `${user.user_name} just added a book!`
            })
          );
        }
      });
      response
        .status(201)
        .json({
          status: 'success',
          message: `Thank you ${user.user_name}!`
        })
    }
  })
}
```
### The Client

On the client side, we will display any incoming message as an alert (we will have to add a bit of css - see below). In order to make that happend, we will have to:

1.  Open up a connection to the WebSocket server on port 8080.
2.  Listen for incoming messages
3.  Add a mechanism for displaying messages in our UI

We will need to add the following code to out javascript:
```javascript
let connection = new WebSocket('ws://localhost:8080') // open the connection
connection.addEventListener('message', message => {
  let alerts = document.getElementsByClassName('alert');
  while (alerts[0]) {
    alerts[0].parentNode.removeChild(alerts[0]); // remove any alerts already displayed 
  }
  let incomingMessage = {} 
  try {
    incomingMessage = JSON.parse(message.data) // check if the incoming message can be parsed
  } catch {
    incomingMessage.message = message.data // otherwise use the string
  }

  let headerElement = document.getElementById('header') // get hold of the #header element
  let incomingMessageDisplay = document.createElement('div') // create a new div that will be used to display the message
  let htmlTemplate = `
    <div class="alert">
      <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
      ${incomingMessage.message}
    </div>` 
  incomingMessageDisplay.innerHTML = htmlTemplate 
  headerElement.insertAdjacentElement('afterend', incomingMessageDisplay) // add the message to the UI below the #header element
  if (incomingMessage.status === 'success') {
    // here we are checking if the message was sent as part of the book creation flow. 
    // if it is, we are fetching the books anew.
    displayBooks()
  }
})
```
We also want to add the following css to our project:
```css
/* The alert message box */
.alert {
  padding: 20px;
  background-color: green; 
  color: white;
  margin-bottom: 15px;
}

/* The close button */
.closebtn {
  margin-left: 15px;
  color: white;
  font-weight: bold;
  float: right;
  font-size: 22px;
  line-height: 20px;
  cursor: pointer;
  transition: 0.3s;
}

.closebtn:hover {
  color: black;
}
```