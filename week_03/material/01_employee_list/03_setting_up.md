## Configurations
Before any coding can be done, we will need to setup our environment, so let's get at it!

The agency has requested the app to be written with ReactJS, which is quite fortunate, since that's exactly what we're good at.  
Let's start scaffolding the application with React's own app generator ```create-react-app```. This tool saves us from a lot of time-consuming configuration with pre-configured dependencies such as Webpack and Babel. Instead, we can go straight at it and focus on our job - building functionality.

```$ yarn create react-app employee_management```

**Now, let's clean up the application, commit the changes when satisfied, and move on to setting up our testing framework**

## Cypress
**Step 1:** Install cypress and save it as a development dependency:  
```$ yarn add cypress --dev```  

**Step 2:** Once we are done with installation, we can launch cypress by:  
```$ yarn run cypress open```  
This command will run a configuration script and add a bunch of example tests that can be a reference for you, and help you to get to know the various Cypress commands.  

**Step3:** Let's also configure a default URL for Cypress to use, so we don't have to specify this in our tests:  
Inside ```cypress.json```, add the following line to the empty object:  

```"baseUrl": "http://locahost:3001"```  

**Step 4:** Configuring the scripts and the server.  
There's a myriad of ways to set up our local server. We have found the ```start-server-and-test``` helper package to be a convenient solution, so let's add that to our development dependencies:  
```$ yarn add -D start-server-and-test```  

Now, we need to go to our ```package.json``` and add the following lines to our ```scripts``` section: 
```
"start:silent": "PORT=3001 BROWSER=none react-scripts start",
"cy:open": "cypress open",
"cypress": "start-server-and-test start:silent http://localhost:3001/ cy:open"
```
You can add the lines anywhere inside the ```scripts``` object, just remember to end each line with a comma - except for the very last line!  

**Beautiful!**  
Last thing will be to just remove the examples folder from ```cypress/integration/examples``` and we are ready to roll.