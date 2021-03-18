
Let’s develop a simple feature. In the scenario, a user will visit the application’s landing page and see a list of news articles displayed.

In your spec folder create a requests folder and in that folder another folder called api and then in there a file called something like db:api_responds_with_a_collection_of_articles_spec.rb

Let’s start by creating a high-level test file.

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/z1Yoq2R5eI2jWOsRpXQG)

Make sure that you have created a database before you run your test.
```
rails db:create db:migrate
```
Run the scenario and see it fail.
```
$ rspec spec/features/user_can_see_list_of_articles_spec.rb
```
You will see that it fails since the route root_path is not defined. Let’s add it to our `config/routes.rb` file:

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/DSiyHB7RsyolqaMcvw5o)

The basic meaning of creating a **route** involves mapping a URL to a controller and an action. When the **Rails** router sees a request it dispatches it to a controller's action matching the URL

Now implement the controller that will serve the us the end point for an index route. For that, we will use a Rails Generator.
```
$ rails g controller api::articles index
Running via Spring preloader in process 56508
      create  app/controllers/api/posts_controller.rb
      invoke  rspec
```
So with this command we created a new controller and a new folder called api in our controllers folder. We also invoked RSpec but it didn't create anything for us.

Now that we have the index action in the ArticlesController, let’s run our tests again. We now have a new error.
```
$ rspec spec/requests/api/api_responds_with_collection_of_articles_spec.rb
[Coveralls] Using SimpleCov's 'rails' settings.

GET /api/articles
  successfully
    is expected to return a 200 response status (FAILED - 1)
    is expected to return all articles (FAILED - 2)
    is expected to return articles titles (FAILED - 3)

Failures:

  1) GET /api/articles successfully is expected to return a 200 response status
     Failure/Error: expect(response).to have_http_status 200
       expected the response to have status code 200 but it was 204
     # ./spec/requests/api/api_responds_with_collection_of_articles_spec.rb:9:in `block (3 levels) in <main>'

  2) GET /api/articles successfully is expected to return all articles
     Failure/Error: JSON.parse(response.body)
     JSON::ParserError:
       767: unexpected token at ''
     # ./spec/support/response_json.rb:4:in `response_json'
     # ./spec/requests/api/api_responds_with_collection_of_articles_spec.rb:13:in `block (3 levels) in <main>'

  3) GET /api/articles successfully is expected to return articles titles
     Failure/Error: JSON.parse(response.body)
     JSON::ParserError:
       767: unexpected token at ''
     # ./spec/support/response_json.rb:4:in `response_json'
     # ./spec/requests/api/api_responds_with_collection_of_articles_spec.rb:17:in `block (3 levels) in <main>'

Finished in 0.08285 seconds (files took 1.32 seconds to load)
3 examples, 3 failures

Failed examples:

rspec ./spec/requests/api/api_responds_with_collection_of_articles_spec.rb:8 # GET /api/articles successfully is expected to return a 200 response status

rspec ./spec/requests/api/api_responds_with_collection_of_articles_spec.rb:12 # GET /api/articles successfully is expected to return all articles

rspec ./spec/requests/api/api_responds_with_collection_of_articles_spec.rb:16 # GET /api/articles successfully is expected to return articles titles
```
This means that we get an empty response. It is time for us to move into unit testing and create our Article model.