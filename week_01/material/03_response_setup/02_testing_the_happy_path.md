The first test we will write is the so-called “Happy Path”. We know that a transaction can either be successful or rejected for some reason. We’ll get back to the rejections (that is the lion-share of the work that lies ahead of us). At this stage, let’s focus on a simple successful transaction.

Let’s start with preparing our test.
```
As an ATM operator          
In order for the right person to make a withdrawal            
I want each person to have a separate account
```

The ATM needs to interact with another class - we will call it `Account`. The Account class will symbolize both the bank account and a card we can use in the ATM (there is no need to create both an Account class and a Card class for the sake of this prototype).

However, we have not created that class yet, so in our `atm_spec` we will use a so-called `instance_double` to be able to test the functionality. Doubles are objects that can be used as stand-ins for instances of other classes (hence the name `instance_double`). Even if they still are not defined (as in our case). You can think of doubles as “fake” objects that we use for testing. We don’t want to build the `Account` class yet, so we’ll just make a fake one for now ( We will go over doubles more extensively further down the road in the camp).