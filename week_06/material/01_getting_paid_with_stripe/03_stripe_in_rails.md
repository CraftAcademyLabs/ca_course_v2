## Stripe in Rails

So now it is time to implement Stripe for our API as well. I our API we will deal with `step 4` and `step 5` of the flow that was described in the intro.
We will receive a request from our `Client` with the `token` and with that send of a request to `Stripe` together with the `amount` and the `secret key` and then receive a response from `Stripe` and send that result back to our `Client`.
So let's get after it!

We will start with a test, **as always**:

**01_api**

```ruby
RSpec.describe 'GET /api/donations', type: :request do
  describe 'successfully' do
    let!(:registered_user) { create(:user) }
    let!(:user_headers) { registered_user.create_new_auth_token }
    before do
      post '/api/donations',
           params: {
             stripeToken: '123456789' # This token is of course nonsens, as you saw when you stopped the execution and looked at the Stripe token then it is much more complex than this. But we will use this dummy token for now.
           },
           headers: user_headers
    end

    it 'is expected to return 200 status' do
      expect(response).to have_http_status 200
    end

    it 'is expected to return a success message' do
      expect(JSON.parse(response.body)['message']).to eq 'Payment successfull'
    end

    it 'is expected to turn user into subscriber' do
      expect(registered_user.donator).to eq true
    end
  end
end

```

Now we will be faced with some `error messages` that we know so well. We are missing a route to make a `POST` request to `donations` and we are also missing this specific controller.
**Make sure to overcome these error messages until you reach one that says something about a `create action` not existing.** If you need a push in the right direction, have a look at the material from `week 4`.

With that done, let's focus on the `create action` in our `Donations Controller`.
**02_api**

```ruby
before_action :authenticate_user!

def create
  paid = perform_payment
end

private

def perform_payment
  customer = Stripe::Customer.create(
    email: current_user.email,
    source: params[:stripeToken],
    description: "Donation"
  ) # first we need to create a customer in Stripe, and for that we use the logged in users email and the token that we got from Stripe with all the details about the card
  charge = Stripe::Charge.create(
    customer: customer.id,
    amount: 100,
    currency: 'sek'
  ) # Then we need to create a charge, and to do that we need a customer, that we just created.
  # put a binging pry here and have a look at the charge variable! It contains a lot of information...

  charge.paid # this method will return a boolean, either true or false
end
```

The first error we will face now is of course that our API has no clue what Stripe is, so let's add that gem!
Remember to put it in the first group, so it is available in all environments!

```ruby
gem 'stripe-rails'
```

And then we need to `bundle` as always.
But now we are facing some errors about the secret key not being available, and that is because as we went through in the introduction, we need to provide the secret key to Stripe.
And we shouldn't have any secret keys out in the open in our code base, so it is time for us to open up our credentials.

```
$ EDITOR="code --wait" rails credentials:edit
```
**03_api**
```yaml
stripe
  publishable_key: <your publishable key from Stripe>
  secret_key: <your secret key from Stripe>
```

For stripe to be able to access our credentials we need to do the following setup in our `application.rb`:
**04_api**
```ruby
config.stripe.publishable_key = Rails.application.credentials.stripe[:publishable_key]
config.stripe.secret_key = Rails.application.credentials.stripe[:secret_key]
```

Now, remember that fake token we put in? That comes to bit us now. To solve that error we need to add another `gem` to be able to use some fake data. And this `gem` should be in the `:test` group!

```ruby
gem 'stripe-ruby-mock', require 'stripe_mock'
```

Now we need to modify our test to make use of this gem. Your test should look like this:
**05_api**
```ruby
require 'stripe_mock'
RSpec.describe 'GET /api/donations', type: :request do
  describe 'successfully' do
    before(:each) { StripeMock.start }
    after(:each) { StripeMock.stop }
    let!(:registered_user) { create(:user) }
    let!(:user_headers) { registered_user.create_new_auth_token }
    before do
      post '/api/donations',
           params: {
             stripeToken: StripeMock.create_test_helper.generate_card_token
           },
           headers: user_headers
    end

    it 'is expected to return 200 status' do
      expect(response).to have_http_status 200
    end

    it 'is expected to return a success message' do
      expect(JSON.parse(response.body)['message']).to eq 'Payment successfull'
    end

    it 'is expected to turn user into subscriber' do
      expect(registered_user.donator).to eq true
    end
  end
end

```

**06_api**

```ruby
def create
  paid = perform_payment # so paid will be either true or false, depending on what perform_payment returns, and depending on that, we will render different things.

  if paid
    current_user.update_attribute(:subscriber, true)
    render json: { message: "Payment successfull" }
  else
    render json: { message: "Something went wrong" }, status: 422
  end
end

```
And with that, all our tests should go green, our user should be a donator when the payment has gone through and if you connect the dots now between your client and your API you should have successfully implemented your first payment solution! 
