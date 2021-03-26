Our approach to writing new software is to always do the most important thing first and get it done before I move on to other, less important, functions. What is the core functionality of this application? I would argue that creating an ATM that has some funds is the first thing that we should focus on. If there is no ATM you will not be able to withdraw, right? And it the ATM has no funds you won’t be able to get any cash from it either.

So we will start with creating an `ATM` class and assign some funds to each `ATM` that we create. You already know a little bit about classes from the ITP Course

Since we are working with TDD, we start with creating a test file first.

As a reminder, We must agree on three things at this point.
```
As a User       
In order to withdraw      
The ATM needs to have funds
```

• Your **tests/specs** are placed in the `spec` folder

• Your **implementation (or production code)** are placed in the `lib` folder

• Your **settings** (like Gemfile, etc.) are placed in the main project folder

Alright?