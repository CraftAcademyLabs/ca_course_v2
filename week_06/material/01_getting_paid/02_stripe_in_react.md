## Stripe in React

We will start with our client and with the help of `Cypress` and automated tests we will cover the steps 1, 2, 3 and 6 in the flow that was described previously.

### Just accessing the form

It's not news to you anymore that we always start with the test and that we move forward step by step. So what is the first step? **Accessing the form where we will fill on our card information.** But one detail that we need to have in mind for that step is that Stripe requires an `email` to be able to charge a customer. In our case, the easiest thing to do is to make sure that the user is authenticated, because then we can easily access the email in our `API`.

So let's start with the test where we make sure that the user is authenticated and then can access a form to fill in card details.
**01_client**

```javascript
describe("User can become subscriber", () => {
  describe("successfully", () => {
    beforeEach(() => {
      cy.server();
      cy.route({
        method: "GET",
        url: "http://localhost:3000/api/products",
        response: "fixture:product_data_.json",
      });

      cy.route({
        method: "POST",
        url: "http://localhost:3000/api/auth",
        response: "fixture:successfull_sign_up.json",
        headers: {
          uid: "user@mail.com",
        },
      });

      cy.visit("/");

      cy.get('[data-cy="register-cta"]').click();
      cy.get('[data-cy="email"]').type("thomas@craft.com");
      cy.get('[data-cy="password"]').type("password");
      cy.get('[data-cy="password-confirmation"]').type("password");
      cy.get('[data-cy="register"]').click();
    });
  });

  it("by filling in valid credit card information", () => {
    cy.get("[data-cy=donate]").click();

    cy.get("[data-cy=payment-form]").should("exist");
  });
});
```

Obviously this will fail, because there is no such button as we are looking for yet. We will create a new component for the button and the form and let's call it `Donation`.

**02_client**

```javascript
// App.jsx
{
  this.state.authenticated && (
      <Donation />
}
```

**03_client**

```javascript
import React, { Component } from "react";

class BecomeSubscriber extends Component {
  state = {
    renderForm: false,
  };

  render() {
    return (
      <>
        {this.state.renderForm ? (
          <form data-cy="payment-form">
            <div> GIVE ME YOUR CREDIT CARD INFO! </div>
          </form>
        ) : (
          <button
            data-cy="donate"
            onClick={() => this.setState({ renderForm: true })}
          >
            Donate money
          </button>
        )}
      </>
    );
  }
}

export default BecomeSubscriber;
```

With that done and our tests going green, it is time for us to deal with some configuration of Stripe. First we need to add the package with Stripe Elements to be able to use them in our application.

```
$ yarn add react-stripe-elements
```

Then we also need to add a `script` to our `index.html` to be able to tap into all the functionality with Stripe.
**04_client**

```html
<head>
  <!-- ... -->
  <script src="https://js.stripe.com/v3/"></script>
</head>
```

To be able to test the functionality of the Stripe elements, then we need to turn off the web security in our test environment, so head to your `cypress.json`:

```json
{
  //...
  "chromeWebSecurity": false
}
```

Now we need to wrap our application with a `Provider` from Stripe. That is done by wrapping the `App` component in our `index.js`:
**05_client**

```javascript
// index.js

import { StripeProvider } from "react-stripe-elements";

ReactDOM.render(
  <StripeProvider apiKey="">
    <App />
  </StripeProvider>,
  document.getElementById("root")
);
```

Where the `apiKey` is, you need to put your own `publishable key` that you get from your Stripe account.
**Important!!** Make sure it is the `publishable key` and **NOT** the `secret key` that you put there.

And then we also need to wrap our `Donation` component with the `Elements` component from Stripe.
**06_client**

```javascript
{
  this.state.authenticated && (
    <Elements>
      <Donation />
    </Elements>
}
```

And the last configuration that we need to do is with our `Donation` component and that is the following:
**07_client**

```javascript
import React, { Component } from "react";
import { injectStripe } from "react-stripe-elements";

class Donation extends Component {
  state = {
    renderForm: false,
  };

  render() {
    return (
      <>
        {this.state.renderForm ? (
          <form data-cy="payment-form">
            <div> GIVE ME YOUR CREDIT CARD INFO! </div>
          </form>
        ) : (
          <button
            data-cy="donate"
            onClick={() => this.setState({ renderForm: true })}
          >
            Donate money
          </button>
        )}
      </>
    );
  }
}

export default injectStripe(Donation);
```

**08_client**
Alright, let's get back to our test and start making things happen!

But actually this time we will do things a little bit reversed for once and start with the implementation and then write the test.

**09_client**

```javascript
import React, { Component } from "react";
import { injectStripe, CardNumberElement } from "react-stripe-elements";

class Donation extends Component {
  state = {
    renderForm: false,
  };

  render() {
    return (
      <>
        {this.state.renderForm ? (
          <form data-cy="payment-form">
            <div id="card-number">
              <label>Card Number</label>
              <CardNumberElement />
            </div>
          </form>
        ) : (
          <button
            data-cy="donate"
            onClick={() => this.setState({ renderForm: true })}
          >
            Donate money
          </button>
        )}
      </>
    );
  }
}

export default injectStripe(Donation);
```

Because if you run your test now, you will see that the `CardNumberElement` is actually an input field, but not any input field you see... There is a lot of underlying functionality and security in that input field and that's why we had to turn off the web security.
**10_client**

```javascript
cy.wait(1000);

cy.get("#card-number").within(() => {
  cy.get('iframe[name^="__privateStripeFrame"]').then(($iframe) => {
    const $body = $iframe.contents().find("body");
    cy.wrap($body)
      .find('input[name="cardnumber"]')
      .type("4242424242424242", { delay: 50 });
  });
});
```

Wow, that was a lot now! And it is, tapping into these elements is a handful and we have skilled developers before us to thank for this solution.

Now with that, we can see that this input field is being filled in! Now we can keep adding the rest of the input fields in the same way.

**11_client**

```javascript
cy.get("#card-expiry").within(() => {
  cy.get('iframe[name^="__privateStripeFrame"]').then(($iframe) => {
    const $body = $iframe.contents().find("body");
    cy.wrap($body).find('input[name="exp-date"]').type("1222", { delay: 10 });
  });
});

cy.get("#card-cvc").within(() => {
  cy.get('iframe[name^="__privateStripeFrame"]').then(($iframe) => {
    const $body = $iframe.contents().find("body");
    cy.wrap($body).find('input[name="cvc"]').type("999", { delay: 10 });
  });
});
```

**12_client**

```javascript
{
  this.state.renderForm ? (
    <form data-cy="payment-form">
      <div id="card-number">
        <label>Card Number</label>
        <CardNumberElement />
      </div>

      <div id="card-expiry">
        <label>Card Expiry</label>
        <CardExpiryElement />
      </div>

      <div id="card-cvc">
        <label>Card CVC</label>
        <CardCVCElement />
      </div>
    </form>
  ) : (
    <button
      data-cy="donate"
      onClick={() => this.setState({ renderForm: true })}
    >
      Donate money
    </button>
  );
}
```

With that done and all tests are passing, it's time to submit this data and make the first call to Stripe and in the end get a message that tells us that the payment went through!

**12_client**

```javascript
cy.get("button").contains("Submit Donation").click();

cy.get("[data-cy=payment-message]").contains("Payment successfull");
```

Soon we will make a call to our `API` so while we are dealing with that test let's add that stub as well.
But hey, you might be thinking now! Aren't we going to make a call to the Stripe API first? Well both yes and no, we don't ned to stub that call out since that is made available to us through the `elements` and the `script`.
**13_client**

```javascript
cy.route({
  method: "POST",
  url: "http://localhost:3000/api/subscriptions",
  response: "fixture:stripe_response.json",
});
```

The next step is of course to create that fixture:
**14_client**

```json
{
  "paid": true,
  "message": "Payment successfull"
}
```

Now we have updated our tests and we can focus on the implementation until we reach our goal.
The first thing we need to do is to make sure that the form can actually be submitted and so that action takes us to a function.
**15_client**

```javascript
<form data-cy="payment-form" onSubmit={this.payWithStripe}>
  <div id="card-number">
    <label>Card Number</label>
    <CardNumberElement />
  </div>

  <div id="card-expiry">
    <label>Card Expiry</label>
    <CardExpiryElement />
  </div>

  <div id="card-cvc">
    <label>Card CVC</label>
    <CardCVCElement />
  </div>
  <button>Submit Donation</button>
</form>
```

**16_client**

```javascript
payWithStripe = async (event) => {
  event.preventDefault(); // we always have to prevent an html form from doing the default- send it self of and re-render the page. It's a legacy thing!

  let stripeReponse = await this.props.stripe.createToken();
  // put debugger here and have a look at the stripeResponse
  stripeReponse.token && this.performPayment(stripeReponse.token.id);
};
```

The `performPayment` function does not yet exist and that is our next thing to do:

**17_client**

```javascript
performPayment = async (stripeToken) => {
  let headers = localStorage.getItem("userData");
  headers = JSON.parse(headers);

  let response = await axios.post(
    "/subscriptions",
    {
      stripeToken: stripeToken,
    },
    {
      headers: headers,
    }
  );

  if (response.data.paid) {
    this.setState({ message: response.data.message });
  }
};
```

So, let's pause for a second and go through what is happening here. In the `payWithStripe` function we are doing `Step 1` from the flow, we are requesting the Stripe Api for the `token`. If everything goes through and we get the `token`, then we do `Step 2` in the `performPayment` function, we send of the `token` to our own API.

```javascript
{
  this.state.message ? (
    <p data-cy="payment-message">{this.state.message}</p>
  ) : (
    <>
      {this.state.renderForm ? (
        <form data-cy="payment-form" onSubmit={this.payWithStripe}>
          <div id="card-number">
            <label>Card Number</label>
            <CardNumberElement />
          </div>

          <div id="card-expiry">
            <label>Card Expiry</label>
            <CardExpiryElement />
          </div>

          <div id="card-cvc">
            <label>Card CVC</label>
            <CardCVCElement />
          </div>

          <button>Submit payment</button>
        </form>
      ) : (
        <button
          data-cy="become-subscriber"
          onClick={() => this.setState({ renderForm: true })}
        >
          Become subscriber
        </button>
      )}
    </>
  );
}
```
Examine this code carefully, there is one `turnery operator` embedded in another. So if we have a message, then we show that. But if we don't have a message then we check if the form should be rendered, and then we show either the form or the button to render the form. Inception!

But, with that done, our tests should go green and we are done with our client implementation and feature! 
