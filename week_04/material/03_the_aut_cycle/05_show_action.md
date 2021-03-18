
A client can now successfully request a collection of all the articles that the API has in the database. The next step is that a client can request a specific article by sending in an id of that specific resource.

Create a new request spec.
```
$ touch spec/requests/api/api_responds_with_a_specific_article.rb
```
![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/Ldiu33b3Q9C6FLrwBb30)

When you run this feature in the terminal (`$ rspec spec/requests/api/api_responds_with_a_specific_article.rb`) you should get this error message.
```
1) GET /api/articles/:id successfully
     Failure/Error: create(:article, title: 'This is the latest news', body: 'And this is some mind blowing content')
     
     NoMethodError:
       undefined method `body=' for #<Article:0x0000565507b5ba28>
```
At this point, our `Article` model only has one attribute, `:title`. Now when we are going to request a single article we want to add a body with some content as well. Since we don't have a `:body` attribute for the article model we can't create one with it.

So we need to add the `:body` attribute. First we want to update the existing unit spec for the `Article` model.

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/RJzu5XHRd2PaWsamBOpd)

If you run the unit specs now (`rspec spec/models`), you will get this error message.
```
1) Article DB table is expected to have db column named body
    Failure/Error: it { is_expected.to have_db_column :body }
      Expected Article to have db column named body (Article does not have a db column named body.)
    # ./spec/models/article_spec.rb:5:in `block (3 levels) in <top (required)>'

2) Article Validations is expected to validate that :body cannot be empty/falsy
   Failure/Error: it { is_expected.to validate_presence_of :body }

   Shoulda::Matchers::ActiveModel::AllowValueMatcher::AttributeDoesNotExistError:
     The matcher attempted to set :body on the Article to nil, but that
     attribute does not exist.
```
It is time to create a migration to add the `:body` column to `Article`.
```
$ rails g migration AddBodyToArticle body:text
```
![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/SjGFRPfT1e6VtxmfgpQs)

In order to add this column, we need to migrate the database.
```
$ rails db:migrate
```

If you run the unit test again you will have a new error message.
```
1) Article Validations is expected to validate that :body cannot be empty/falsy
     Failure/Error: it { is_expected.to validate_presence_of :body }

       Expected Article to validate that :body cannot be empty/falsy, but
this could not be proved.

        After setting :body to ‹nil›, the matcher expected the Article to
be invalid, but it was valid instead.
```
At the moment the only thing we validate the presence of in the `Article` model is `:title`.

We need to add `:body`.

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/4CHlolMQSNm8Fv7PD6gJ)

We now have a new error message when we run the unit test.
```
1) Article Factory should have valid Factory
     Failure/Error: expect(FactoryBot.create(:article)).to be_valid

     ActiveRecord::RecordInvalid:
       Validation failed: Body can't be blank
```
The `FactoryBot` for `Article` tries to create an instance without adding `:body`.

We need to add `:body` to the definition of the `Article` factory.

Update the following file:

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/jIAxm43RHWgS8KRpY3CT)

You should now get all green when you run the **unit tests** for the `Article` model now.

----------

When you run the feature test now you should have a new error message, the articles have been successfully created in the background step.
```
Failures:

  1) GET /api/articles/:id successfully is exptected to return a 200 status
     Failure/Error: get "/api/articles/#{article.id}"

     ActionController::RoutingError:
       No route matches [GET] "/api/articles/160"
```
At the moment we have only opened up the resources for the index route but no other routes. We need to open up a route to a show action to be able to make the request that we want.

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/mQgo2niyQTGmTP048Utb)

We get a new error message when we run the feature test.
```
Failures:

  1) GET /api/articles/:id successfully is exptected to return a 200 status
     Failure/Error: get "/api/articles/#{article.id}"

     AbstractController::ActionNotFound:
       The action 'show' could not be found for Api::ArticlesController
```
We only have an `index` action in our controller so as the error message says we now need to add a `show` action. For now, we don't know what to put in that action, so we will just follow our error message and do the bare minimum to get rid of that error and perhaps get a new one. Therefor we will only add an empty `show` action.

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/tK5t4fVSbixQYWulc6rd)
```
Failures:

  1) GET /api/articles/:id successfully is exptected to return a 200 status
     Failure/Error: expect(response).to have_http_status 200
       expected the response to have status code 200 but it was 204
```
We get a new error but this one we recognise and we've been here before. We get a 204 response status which means that we hit the right route and the right action in our controller, so everything is going okey, but we don't get anything in return. The response is empty.

Let's fix that!

In our `show` action we want to add the following code:

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/XaxsNFJWRoGRKhdR0UUk)

Before we celebrate success we need to go over what we are doing here. First we want to find the article in our database that has the same `id` ad the one we send in with our `route params`. In Rails we then have access to a method called `.find` which takes one argument and that has to be the `primary key` of the resource that we want to find. In Rails, the `primary key` is always the `id`. Then we store that resource in a variable called `article` and then we render `json` with that `article` as an object stored in the keyword `article`.

**If we run our tests now they should all be green!**

-------
## Wrap up
During this walkthrough, we have completed two Acceptance-Unit Cycle (without the refactoring part) and added a simple feature that allows a client to request a collection of articles and also the feature that allows a client to request for a specific article.

Using our tests we were able to craft out some functionality and delivered the objective of the two features: To send off a list of articles and one specific article.

- We created two routes (URL)
- We created an Article model with attributes and validations
- We created a controller with an index method that fetches all articles from the database and stores the collection in a variable that is made available as json.
- We created a show method that one specific article from the database based on the ID that we send in as a route param and stores that specific resource in a variable that is made available as json.
In the next cycle, we would certainly add more scenarios to this feature to test other paths. What should happen when there are no articles in the system? What happens if we try to send an ID that doesn't belong to any resource in our database?

**It takes a little practice but with this approach, you are constantly in charge of the workflow and know what the next step of your implementation should be.**