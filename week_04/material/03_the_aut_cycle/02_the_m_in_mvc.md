Let’s think about how we want our Articles to be structured:

-   We need to be able to store Articles in our database - meaning we need to create a Model
-   We want each article to have a `title` - we need to add this attributes to our Article model as a string
-   We don’t want to store articles that don’t have a `title` present - meaning we need to add a validation that this attribute is not empty
-   We want to make sure that there is a valid Factory to use in our test environment

The first thing we want to do is to generate this model that we just described the structure for:
```
$ rails g model article title:string
```
the create a spec file in the `spec/models` folder called `article_spec.rb`. Let’s add some tests (we will use the matchers provided to us by the `shoulda-matchers` gem that extends the built-in RSpec matchers).

Run these commands in the terminal:
```
$ rails g model article title:string

Running via Spring preloader in process 57472
      invoke  active_record
      create    db/migrate/20201214145557_create_articles.rb
      create    app/models/article.rb
      invoke    rspec
      create      spec/models/article_spec.rb
      invoke      factory_bot
      create        spec/factories/articles.rb
```
This created a lot of files and code for us.

The first thing we need to look at and make sure it is good is our migration:

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/Y0a6dYVNQ0xbnvEtZpjA)

If your migration looks something like this then go ahead and migrate your database!
```
$ rails db:migrate
  == 20160725233007 CreateArticles: migrating ===================================
  -- create_table(:articles)
    -> 0.0295s
  == 20160725233007 CreateArticles: migrated (0.0296s) ==========================
```