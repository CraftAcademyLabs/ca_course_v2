## Fetching data from an API
The time has come for us to send a request out into cyberspace and hopefully get a useful response in return.  

By now, you should at least be familiar with the http protocol and the main http verbs - but let's have 'em again, just for the record:
```
C - Create: (post requests)
R - Read: (get requests)
U - Update: (put/patch requests)
D - Delete: (delete requests)
```
In our case, we want to retrieve some data, which in turn will be rendered in our app. So what kind of request are we talking here..?

**A ```get``` request! Bingo!**

To help us in this endeavour, we are going to use a tool called **Axios**. Axios is a library for making asynchronous network requests. It is designed to handle http requests and responses and has become an industry standard.  
We will use the [reqres](https://reqres.in/) API in this scenario, which is a simple API for front-end testing that provides fake 'life-like' data.

We will start by adding this tool to our dependencies and then importing it in our ```EmployeeList``` component!  

```$ yarn add axios```  

```import axios from 'axios'```

Next, we remove our hard-coded data from the ```employees``` state, leaving it an empty array.   
Then we start building the function that will send the requests and handle the responses. Let's call it ```getEmployees()```:

**image: sending_a_request_01**

Since Axios isn't evaluating instantly (as it takes just a fraction of a second to make this request), we want to halt the control flow of the function until the response has been completely received.  

To accomplish this, we use the ```async...await``` functionality, making the function ```asynchronous``` and allowing us to ```await``` the axios call.

Inside the function, we store the data retrieved from the ```axios.get()``` API call to **reqres** into the variable ```employeeData```.  

We then dig into this variable (that evidently has turned out to contain an object, ```data```, that contains another object, ```data```, that then holds an array of employee objects) - and store that array in our ```employees``` state.

Perfect, now we have the functionality, however our test is back in the red. How come?  

*(Also, don't forget your commits!)*

### componentDidMount()
While the functionality is in place, there is nothing *triggering* our ```getEmployees``` function, meaning that the API request is never sent.

This is a great opportunity to get to know the life cycle of components a bit better. Since we want to display the list of employees immediately as the user visits the site, we want to call our function as soon as the component **mounts** (a.k.a as soon as it renders on the screen).

The ```componentDidMount()``` method is invoked immediately upon mounting, triggering everything inside of its block, which is exactly what we're looking for! Let's pop it in:

**image: sending_a_request_02**

**Let's go and marvel at our now green tests... Add, commit! Well done.**