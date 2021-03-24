# About API's in the context of the Web
API is technically short for "Application Programming Interface" and the term is tossed around in the programming industry so much, that the overall complexity of what they are, and how they can make your life easier - or a living hell - gets overlooked.

Some definitions:

"a set of programming instructions and standards for accessing a web-based software application or web tool"

"a set of functions and procedures allowing the creation of applications that access the features or data of an operating system, application, or other service."

"...to provide a way to connect computer software components together"

Some time ago, it became a big thing for web startup to offer public access to some of their internal data through a web service API, typically using REST and JSON, thus allowing third-party developers to integrate with their systems. Web developers started using the term "API" to mean specifically (and only) "publicly accessible web service", and misusing it to include the implementation thereof. Okay, we will be working on this a lot moving forward, so today is NOT the day for a deep dive into this concept and becoming experts. Today is the day when we will make use of an API for the first time, and later, we will dissect what occurred and go over some of the moving parts.

In typical web application architecture, we have frontend/client side(detached from the backend) and server side/backend. Normally, the backend and frontend run on different servers with different domain names and may even be in different locations too.  
They should be able to communicate with each other to share information. Frontend is responsible for capturing the users inputs,validating it, and sending it to the server, but also for fetching and displaying the data on browser.  
The backend is responsible for storing and retrieving data from the database, as well as formatting the responses appropriately. 

In this exercise, we will make use of an API that is public and allow us to fetch some data (we often use the expression "provides API endpoints" - I will explain this expression further down the line.)

Let's execute this in our browser's console (in your developer tools, when you inspect a webpage):

```
const xhr = new XMLHttpRequest();
xhr.open('GET', 'https://reqres.in/api/users')
xhr.onload = () => {
  const data = JSON.parse(xhr.responseText)
  console.table(data.data)
}
xhr.send()
```

You can also try this in the Node console in your terminal, but XMLHttpRequest is a built-in object in web browsers only. It is not distributed with Node; you have to install it separately,

Install it with npm:

```$ npm install xmlhttprequest```  

Now you can open ```$ node``` and require it in to carry out the same procedure:

```
const XMLHttpRequest = require("xmlhttprequest").XMLHttpRequest;
const xhr = new XMLHttpRequest();
// ...and the rest of the snippet
```

You can play around with these commands in your browser and the terminal for a bit.