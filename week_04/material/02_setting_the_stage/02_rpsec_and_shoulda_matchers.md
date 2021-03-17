
Add `rspec-rails` gem to the `development` and `test` groups of your Gemfile.

The RSpec extension library `shoulda-matchers` allows us to test common Rails functionality, like validations and associations, with less code.

The gem `factory_bot` is a library for setting up Ruby objects as test data. It’s essentially a fixture replacement. It allows you to create objects that are needed in tests without providing a value for each required attribute. If you don’t provide a value for a required attribute factory_bot will use the default value that you defined in the factory’s definition.

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:2500/https://www.filepicker.io/api/file/wtxIZV9BT7euN5EPpFdc)

Make sure you go to [Rubygems](https://rubygems.org/) are read the documentation on the gems we are using.

Now, we can install all the new dependencies with `bundle.`
```
$ bundle 
```
Run the RSpec generator to add the testing framework to your rails application
```
$ bundle exec rails generate rspec:install
```
Why `bundle exec` before a command? `bundle exec` executes a command in the context of your bundle. That means it uses the gems specified in your Gemfile. It standardizes the environment under which the program runs. This helps avoid version hell and makes life much easier.

Before you can use `shoulda-matchers`, you need to configure it by choosing the test framework and features of `shoulda-matchers` you want to use.

Add this to your rails_helper.rb

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:2500/https://www.filepicker.io/api/file/WDE4oiRxu9nZ02Bf3zQR)

But as mentioned we need to configure shoulda-matchers and we also need to create the ResposeJSON module that we are making use of. The first line we added let's us create a support folder and put the configuration there, to keep our rails_helper.rb clean, so let's start with that.
```
  $ mkdir spec/support
  $ touch spec/support/shoulda_matchers.rb
  $ touch spec/support/response_json.rb
```
![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:2500/https://www.filepicker.io/api/file/xIcS5o7ySInsrXm0iHWw)

Here we are configuring Shoulda Matchers to integrate with RSpec and Ruby on Rails.

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:2500/https://www.filepicker.io/api/file/CslsNNcRAVLGruwTCoEg)

Here we are creating a shorter syntax for our test, instead of having to over and over again write JSON.parse(response.body) when testing the requests we can now get the same hold of the response body by just typing response_json.

Before we move on we need to add another configuration to the Rails application to avoid the generators to scaffold too many files. Make the following modification to the config/application.rb file:

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:2500/https://www.filepicker.io/api/file/lHsFOwMQdqh0UQBWnJ0i)

One last thing in this setup process, open the `.rspec` file (it is located in your main project folder but it is a hidden file, so your text editor might not show it) and modify it so it looks like this:
```
--format documentation
--color
--require rails_helper
```
Now, in your terminal, type in `rspec` and hit enter. The output you see should be something like:
```
$ rspec
No examples found.

Finished in 0.00023 seconds (files took 0.5029 seconds to load)
0 examples, 0 failures
```