Now, that the basic functions are working, it is time to give the ATM a voice of its own. We shall focus on the *happy path* to begin with and configure successful transaction messages. 

As always, we start with a User Story:
```
As an ATM
In order to provide better customer service 
I need to display messages upon successful transactions
```

Next, we meet up with Cypress and create a new test file: ```atmDisplaysMessages.feature.js```

Initially, there's 3 different messages that we want to test for:
- A greeting
- A withdraw message
- A deposit message

The first one is pretty straight forward:

**image: the_atm_speaks_01**

While the test block doesn't feature anything new, there's a new addition to the `describe` block - namely a `beforeEach()` hook. 

Everything inside this hook will be carried out before each test. Since we want to visit the same site for all tests, this is an appropriate place for our `cy.visit`.

Moving on to the two other messages, they call for a bit more action, as we need to carry out a transaction in order to display the message.  
We can write it up like this:

**image: the_atm_speaks_02**

Feel free to add your own messages to give it your own unique feel. My ATM is apparently polite, but quite money-grubbing.. 

These tests will, as usual, go flashing red in Cypress, but for a developer this is an encouraging thing - because then we have a problem to solve! 

## It speaks!
And solve it, we shall. Let's start by making the `message` a dynamic entity by storing its value in a state and setting the default value to our desired welcome message:

**image: the_atm_speaks_03**

Next, we want to configure the rendered JSX element.  
The code base provided an `<h3>` element, just above the `input field`, that would serve perfectly for this.  

Let's give the element a reference id and change its `innerText` to instead display the `message` state:
```
 <h3 id="message">{this.state.message}</h3>
```

**If we now run the test, the first one should go green!**

Moving on, we now want to change the message after a transaction has been done; and all we need to do is revising our `withdraw` and `deposit` functions to also set a new `message` state:

**image: the_atm_speaks_04**

Since we also wanted to display the transacted amount, we `string interpolate` the `amount` into the message. That's all. Not too crazy, right? 

That should do it for the happy path! Let's run the entire test suite and see all 6 tests go green. Happy days!

**This doesn't mean that we're done, though..**

In your Cypress browser, try to type in 10000 and click withdraw. This will leave your balance in huge deficit, and - while the rest of the world keeps printing money in a similar fashion - this is something that we would like to avoid.  

Following the same notion, if we try to leave `amount` empty or type in a **0**, the ATM still performs a transaction. We would like to fix this too.

**So, buckle up, and let's head down the sad path!**