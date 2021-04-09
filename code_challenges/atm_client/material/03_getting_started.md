Let's look through the code base and fire up the app one more time with ```$ yarn start``` and begin thinking about a game plan. There's a few different pieces of functionality that we want to introduce, so let's write them down to establish an overview:

## To-do list:  
- Display the user's balance
- When the withdraw button is clicked, withdraw the typed amount from the balance.
- When the deposit button is clicked, deposit the typed amount to the balance.
- Display messages when a transaction has been completed.
- Display messages if any errors occurs during a transaction. 

**Phew, that's quite a list!**

Deep breaths. Being a good developer is all about splitting the initial problem into smaller problems and creating a plan of attack.
We then want to proceed with a test-driven approach, dissecting the smaller problems into even smaller bits.

Another great tool to help us clarify the problem at hand is to split the functionality up into User Stories, and this is the perfect time to write our first story. Let's start out simple:

```
As a user
In order to know how much money I have available
I would like the ATM to displays my balance
```

## First test
With the above User Story as our scope, let's start formulating our first test to later have its logic guide our implementation code. 

Create a test file:  
``` 
$ touch cypress/integration/atmDisplaysAvailableBalance.feature.js 
```

And add a ```describe``` block:

![](./images/getting_started_01.png)
**image: getting_started_01**

Now, for the actual test. We want the ATM to display the user's available balance, but since we won't be dealing with an actual user in this exercise, but rather the functionality of the ATM, we will settle with setting the initial value to a fixed number, like 1000.  
We can test this like so:

**image: getting_started_02**

Running Cypress (```$ yarn cypress```), this won't fly, of course. While we do have a component, ```Balance.jsx```, designated to displaying the available balance, Cypress won't find any element with an ```id="balance"```. In addition, we're not rendering the correct value either.

Spontaneously, there's an easy fix to this: 

**image: getting_started_03**

However, while this will make our test go green, we're not happy with it, as the value is now hard-coded. Instead, we want to start using one of React's main features: **storing data inside a component's state**.

Head over to ```App.jsx``` and give the component a state named ```balance``` and set its value to ```1000```.

**image: getting_started_04**

Now, we should be able to access this value through ```this.state.balance``` inside the ```App.jsx``` component.  However, this presents another issue as we are rendering the balance inside of the ```Balance.jsx``` component. So, how do we give the Balance component access to its parent's (```App.jsx```) state?

**Introducing ```props```!**

With React's ```props```, we can let child components inherit the state from their parents. We often refer to this as *passing down props*, and is, in our case, accomplished by giving the ```Balance``` element a key, ```balance```, and assigning the state, ```this.state.balance``` as its value.  
Let's check it out:

**image: getting_started_05**

Over in ```Balance.jsx```, we can now access this key (*or prop*) by writing ```this.props.balance```, like so:

**image: getting_started_06**

Similar to `state`, `props` is an object that can store other objects. What's really happening when we pass down the `balance` state object is that it gets nested inside of the `props` object, looking something like this: 
```
props : {
  balance: 1000
}
```
Unlike `states`, however, `props` are immutable, meaning they cannot change.

Notice that we add the inherited balance inside our ```<h2>``` element wrapped in curly brackets. In React, this is how we inject JavaScript functionality directly into the JSX elements.

With this, we have added a dynamic relationship between the two components which we will utilize in the next chapter. 

Let's run the test and just enjoy the green for a moment... Alright, enough! It's time to build some functionality.
