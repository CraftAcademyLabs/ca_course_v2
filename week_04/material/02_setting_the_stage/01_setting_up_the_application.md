If you don’t have Rails installed beforehand, it is time to install it now. Rails is a ruby gem, so you can install it as any other gem:
```
$ gem install rails
```
Once you are done it is time to scaffold the Rails application we will be working with.
```
$ rails new rails_demo --api --database=postgresql --skip-test
```
-   The `--api` is a flag that we pass in so we only scaffold the API part of a Rails application since we will not make use of all the fullstack features
-   The `--database=postgresql` selects PostgreSQL as the database (The out-of-the-box setting is MySQL)
-   The `--skip-test` option skips configuring for the default testing tool.
```
$ cd rails_demo
```
Before you move on, make sure to create your local database.
```
$ rails db:create db:migrate
```
When we are building API’s it is important to enable `CORS`, Cross Origin Resource Sharing. In english it means that we can share and send information and data between applications.

We will use a gem called `rack-cors` for this.

In your `Gemfile` add this to the first group:
```ruby
gem  'rack-cors',  require: 'rack/cors'
```
Now we need to configure this, so navigate to `config/appplication.rb` and inside of the `Application class` add the following:

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:2500/https://www.filepicker.io/api/file/K3jJPmu4SmQssjjS7z8A)

Let’s move on with the setup of our testing framework.