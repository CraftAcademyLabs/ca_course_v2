For this exercise we have been given a pre-scaffolded application that features a digital ATM. However, the ATM is broken and has no functionality. Let's put our minds to work and get this poor machine repaired!  

Head to the [provided repo](url), fork it, and clone it down. 
```
$ git clone [url]
```

```cd``` into the new folder and hit ```$ yarn```

If you like, you can spin up the application to take a look at the broken ATM:
```
$ yarn start
```
As you see, there's not really anything going on. 

## Cypress
Before anything else, let's set up our testing environment.  

**Step 1:** Install cypress and start-server-and-test, and save them as a development dependencies:  

```
$ yarn add cypress start-server-and-test --dev
```  

**Step 2:** Once we are done with installation, we can launch cypress by:  

```
$ yarn run cypress open
``` 

This command will run a configuration script and add a bunch of example tests that can be a reference for you, and help you to get to know the various Cypress commands.  
When you have examined them a bit more, go ahead and delete the examples folder. 

**Step 3:** Let’s also configure a default URL for Cypress to use, so we don’t have to specify this in our tests:

Inside `cypress.json`, add the following line to the empty object:

```
{
  "baseUrl": "http://localhost:3000"
}
```

**Step 4:** As for configuring the scripts and the server, there's a myriad of ways to set up our local server. We have found the ```start-server-and-test``` helper package to be a convenient solution.

Go to ```package.json``` and add the following lines to the ```scripts``` section: 
```
"scripts": {
  //...
  "start:silent": "BROWSER=none react-scripts start",
  "cy:open": "cypress open",
  "cypress": "start-server-and-test start:silent http://localhost:3000/ cy:open"
}
```
You can add the lines anywhere inside the ```scripts``` object, just remember to end each line with a comma - except for the very last line!  

**Beautiful! Now we should be ready to roll.**