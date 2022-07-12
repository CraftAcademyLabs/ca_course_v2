## Stripe

Stripe is one of many payment platforms out there and it will be your first implementation of a payment system in a software service. Stripe is known for being developer friendly with a very powerful and easy to use API that supports a lot of different frameworks and libraries but most importantly for us, Stripe has packages and gems for Rails and React. The Stripe API is also organized around `REST` and returns `JSON` responses. 
It's also free to register and use as long as you are in sandbox mode...

### Register
At least one in your team needs to visit [Stripe](https://stripe.com/) and register an account. By registering an account you will get API keys that are needed to be able to use Stripe. As mentioned, it is free to use for developers in sandbox mode and as long as we are dealing with test data then no real transactions will be made. 

### The Flow
One important thing that we need to understand before getting our hands dirty is the flow of a Stripe payment. 

**Stripe integration image**

This image displays the flow in a good way. Don't focus too much on the word _backendless_, what that is in our flow is our own `API`. 
So if we take this step by step in words: 
1. Our `React Client` collects the card information and sends that to the `Stripe API`, so the card number, expiry date and the cvc code. 
2. The `Stripe API` is verifying the card data and if it is correct and matches an existing card then Stripe will reply with a `token`.
3. The next step is that our `React Client` sends off the `token` that we got from Stripe and the `amount` to our API. If the `amount` isn't going to differ, for example a subscription that is 100 kr, then we don't need to send the `amount`. But if the `amount` will differ depending on what the user does in the application, then we need to provide that to our `API`.
4. Our `API` sends a request to the `Stripe API` with the `amount` and `token` that we sent from our `Client` but our `API` also adds a `secret key` to the request. This `secret key` is something that we get from registering to Stripe. 
5. Now the `Stripe API` will basically verify all the information provided. Through the `token` Stripe can access all the information about the card and will check if the card has credibility to pay the `amount`. Then Stripe will respond with the result of the transaction. If it hasn't gone through, then we will receive an error message regarding what went wrong and otherwise we will get success and `paid: true` from Stripe. 
6. The last step in the cycle is to send of the information we got from Stripe to our own `Client` and then give the user feedback on the payment. 

**Simple as that!** But there is a lot of moving parts and a lot of steps where things can go wrong...

