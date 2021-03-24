## Configurations
Before any coding can be done, we need to setup our environment.

The agency has requested the app to be written with ReactJS, which is quite fortunate, since that's exactly what you excel at.  
Let's start scaffolding the application with React's own app generator `create-react-app`. This tool saves us from a lot of time-consuming configuration, and comes with pre-configured dependencies such as Webpack and Babel. Instead, we can go straight at it and focus on our job - building functionality.

```
$ yarn create react-app employee_management
```

**Now, let's clean up the application, commit the changes when satisfied, and move on to setting up our testing framework**

## Cypress
**Step 1:** Install cypress and save it as a development dependency:  
```
$ yarn add cypress --dev
```  

**Step 2:** Once we are done with installation, we can launch cypress by:  
```
$ yarn run cypress open
``` 

If you need a bit of inspiration, look through the test examples. Otherwise, remove the examples folder from `/integration/examples`

**Step 3:** Let's also configure a default URL for Cypress to use, so we don't have to specify this in our tests:  
Inside `cypress.json`, add the following line to the empty object:  

```
"baseUrl": "http://localhost:3000"
```  

**Step 4:** Now, we set up the server and configure our scripts, like so:

```
$ yarn add start-server-and-test --dev
```  

Over in `package.json`, add the following lines to the `scripts` section: 
```json
"scripts": {
  //...
  "start:silent": "PORT=3000 BROWSER=none react-scripts start",
  "cy:open": "cypress open",
  "cypress": "start-server-and-test start:silent http://localhost:3000/ cy:open"
}
```

**Perfect!**