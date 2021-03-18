One of the cornerstones of RESTful API’s are statelessness. That the server forgets about after it is done responding to our request. In terms of getting a list of articles, receiving the products of an e-commerce site or even looking at a specific product at that site makes sense, we ask for the information and then we get it and the server forgets about us.

But, as a real life example: we don’t have to log into a website over and over again every time we want to post something, upload an image or update our status? So how does that work with statelessness?

User authentication between distributed applications is not an easy thing, and in true Craft Academy spirit we jump right into the deep water and get acquainted with the complex parts sooner rather than later and that will be your weekend challenge.

The answer to the website issue that we painted, is **Token based authentication.**

A user send of a `POST` request with his or hers credentials to start a new `session`. The API validates that the credentials are correct and corresponds to what is stored for that specific user. If the credentials are correct, the API responds with a `token`. This `token` is personal and it will expire after a set amount of time and change frequently, most often with every new request the user makes.

So now when the user wants to perform an action or send a request that requires the user to be authenticated, the token is sent in the `headers` of the request and by that the user can be authorised by the API through the token.

## Set up

Lucky enough, we can get all this functionality from a gem and we don’t need to create this whole flow by ourselves! We will be using `devise_token_auth` a [token-based authentication gem](https://github.com/lynndylanhurley/devise_token_auth) for Rails JSON APIs. It’s build upon one of the most popular authentication libraries in Rails called [Devise](https://github.com/plataformatec/devise).

Make sure you install the `devise_token_auth` gem by adding it to your `Gemfile` and run `bundle install`. Note that you don’t need to add gem `devise` since `devise_token_auth` requires it automatically.
```
#Gemfile
gem 'devise_token_auth'
```
Using a generator that the gem provides, we can create a user model, define routes, etc.

Run the following command for an easy one-step installation.
```
$ rails g devise_token_auth:install User api/auth
```

Make sure to open up the migration file that was generated and add some more columns that are needed in order for Deivse token auth to work properly with our client later. Please add this:
```ruby
#db/migrate/XXX_devise_token_auth_create_users.rb
## The columns we want to add
t.integer :sign_in_count, default: 0
t.datetime :current_sign_in_at
t.datetime :last_sign_in_at
t.string :current_sign_in_ip
t.string :last_sign_in_ip
```
We also want to remove some of the columns that Devise token auth has added to that migration file. There is a section in the migration file that says `## User info`, please remove these columns:
```ruby
t.string :name
t.string :nickname
t.string :image
```
These columns will be removed because we don't have a use case for them and we will not use them anywhere in this application with our current implementation. In this API our users will not have the possibility to set their `:name`, `:nickname` or upload a `:image` of themselves as their profile picture.

In our User model (`app/models/user.rb`) we want to make sure that Devise is set up for our needs. Make sure to read through that file and you can safely remove the comments.

In your `User model` you also need to add this line:
```ruby
extend  Devise::Models
```
```
$ rails db:migrate
```

We need to add some settings to the auto generated initializer for `devise token auth` . The configuration we will do is to make it work a bit easier when connecting our API with a client.

Please comment in the following lines from the generated code in there:
```
# config/initializers/devise_token_auth.rb

DeviseTokenAuth.setup do |config|
  config.change_headers_on_each_request = false
  config.token_lifespan = 2.weeks
  config.batch_request_buffer_throttle = 5.seconds
end
```

**Cool! The setup is done, now it’s time to make use of the functionality that we have got.**