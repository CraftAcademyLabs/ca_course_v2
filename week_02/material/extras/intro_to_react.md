## Intro to React
React is a Javascript Library that deals with separation of concerns in a different way than you might be used to from before. 
The difficult part with starting something new is just that, starting! So it's important to get over that obstacle and get to the coding as soon as possible. In the beginning of the learning curve when starting with a new library or framework it is important to experiment and write a lot of nonsense code to get a understanding of the functionality. That is exactly what we will do now, create a dummy application just to practice working with `state`, `props`, `functional components` and `class components` and get used to how we write functions and event handlers in React. 

Step one is of course to install the scaffolder we will use for this exercise and then use that to create an app. 
The following command will by using `npm` install the `create-react-app` package globally on your computer. That package is what we will use to scaffold a `React app`.
```
$ npm install -g create-react-app
```
With that installed we can now use `yarn` to create an app. But wait now, we just used `npm` and we always go on about consistency? The official documentation of Facebook actually recommends to install `create-react-app` with `npm` but at Craft Academy we recommend you to use `yarn`. Both are package managers and you can choose to always use `npm` if you want, but we will always show you examples using `yarn`. Consistency is key but we have to be open for exceptions. 
Let's continue. 

I will now create a new app called `hello_world`, you can of course name it what ever you want. 
```
$ yarn create react-app hello_world
```
_**NOTICE** that there is no `-` between create and react when actually using the package._

Clean up your application so the folder structure looks like this:
```
├── README.md
├── node_modules
├── package.json
├── .gitignore
├── public
│ ├── favicon.ico
│ ├── index.html
│ └── manifest.json
├── src
│ ├── App.jsx
│ ├── index.css    
│ ├── index.js    
│ └── reportWebVitals.js  
└── yarn.lock
```
Now clean up all the code in your `App.jsx` so it looks like this: 
**01_intro**

By running `yarn start` now you will see that you have your first Hello World application done in React!

### State

First an example of the easiest way to use `state` in React. 
**02_intro**

This will display the exact same thing as before, `Hello World`. But the difference is that `World` is now fetched from state instead of being written in the `return`.

#### Updating the state

Now we want to update the `state` by changing `World` to `Mars`.
**03_intro**

So now there are a few more things happening. First mind how we are setting the `event handler` on the button. In React it is actually standard and good practice to put the event handler directly on the element. Then in the `handlePlanet` function we are calling on the `setState` function which will automatically update the `state` and by that update the `DOM` with the new `state`. Try to click on **Change Planet** and see how it changes to display `Hello Mars` instead. 

So now we have updated an existing key in `state`, now let's update the `state` with a new key. 
**04_intro**

As you can see, we don't declare `surprise` in our initial `state`, simply because we don't need it for anything until the button has been clicked. Then we update the state with `surprise`. If you set a debugger you will see that before the button is clicked, that key doesn't exist, and as soon as you click that button, the `state` is updated with a new key. 

### Props

Props is an object that is sent from parent to child and is read-only data. 
We will start slowly with replacing the `planet state` with a new component for now. 

**05_intro**
**06_intro**

Now the button `Change Planet` doesn't work anymore of course, but we will get back there. But here now we can see that we can render this through another component. 
Now we are not working with props though, here we have just hard coded the value in the `Planet` component. Let's change that and make use of some props!

**07_intro**
**08_intro**

This yields the same result as before, but not we are actually sending `World` as a `prop` from the `App` component to the `Planet` component. But now we can make that value something dynamic:
**09_intro**

Without changing anything in the `Planet` component, we now have the functionality back from the `Change Planet` button. 