## Displaying the weather at the user's location
Once again, it's time to crank the complexity up a notch.  
Our mission this time is to build a Weather App that will display various weather information for the user's location - as well as the location itself.

In the previous challenge, you used data from an API to display a list of employees.  
In this challenge, we'll follow the same concept of receiving data from an external API - but this time, we'll be using 2 APIs that will both use dynamic `query params` based on the user's location.  
Furthermore, we'll be looking into a few more advanced testing techniques in Cypress, namely `stubbing` and `mocking`.

## Learning objectives
- Accessing the user's location
- Using dynamic query params in your API requests
- Working with multiple API calls
- Stubbing and mocking with Cypress
- Further knowledge of styling with Semantic UI

## Scaffolding
Before we pull up in our meteorological uniforms, we should set up our code base. You've been through this a few times now, so I'll spare you the tedious walk-through. 

A small bullet list should suffice:

1. Generate an app and call the folder `open_weather_app`
2. Clean up the code base
3. Install testing and server dependencies
4. Configure `cypress.json` and add additional scripts to `package.json`
5. Put an x on `App.js(x)` and rewrite it into a `class component`

Great. Now, we're in a good place, foundation is laid, mind is sharp and open for new learning.  

**Let's chase some storms!**