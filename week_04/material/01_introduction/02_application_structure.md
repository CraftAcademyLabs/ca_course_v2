Let’s take a look at a Ruby application, and look at all the different files and folders inside of it so we can get an idea of what’s going on.

Below, you’ll see is a top-level view of a directory tree created by the helper script at the time of application creation. Except for minor changes between releases, every Rails project will have the same structure, with the same naming conventions. This consistency gives you a tremendous advantage; you can quickly move between Rails projects without relearning the project’s organization.

The default directory structure of a generated Ruby on Rails application:
```
|-- app
|   |-- assets
|       |-- images
|       |-- javascript
|       `-- stylesheets
|   |-- channels
|   |-- controllers
|   |-- helpers
|   |-- mailers
|   |-- models
|   `-- views
|       `-- layouts
|-- config
|   |-- environments
|   |-- initializers
|   `-- locales
|-- db
|-- doc
|-- lib
|   `-- tasks
|-- log
|-- public
|-- script
|-- test (or spec)
|   |-- fixtures
|   |-- functional
|   |-- integration
|   |-- performance
|   `-- unit
|-- tmp
|   |-- cache
|   |-- pids
|   |-- sessions
|   `-- sockets
`-- vendor
    |-- assets
        `-- stylesheets
    `-- plugins

----------
```
## `app`

This folder contains your application. Therefore it is the most important folder in Ruby on Rails and it is worth digging into its subfolders. See the following rows.

## `app/channels`

ActionCable is one of the core frameworks in Ruby on Rails and it gives us the functionality to work with web sockets. That is above your pay grade at the moment but we will visit the channels later in on the bootcamp.

## `app/controllers`

The controllers subdirectory contains the `controllers`, which handle the requests from the users. It is often responsible for a single resource type, such as places, users or attendees. `controllers` also tie together the `models` and the `views`.

## `app/jobs`

Jobs can be set up to run in the background of your application. If you for example want to save some server costs by logging out every user that hasn't been active for half an hour, that would be taken care of by a job.

## `app/mailers`

Functionality to send emails goes here

## `app/models`

The models subdirectory holds the classes that model the business logic of our application. It is concerned with the things our application is about. Often this is data, that is also saved in the database. Examples here are a `Person`, or a `Place` class with all their typical behavior.

## `app/views`

The `views` subdirectory contains the display templates that will be displayed to the user after a successful request. By default, they are written in HTML with embedded ruby (`.html.erb`). The embedded ruby is used to insert data from the application. Since we will be using Ruby on Rails to build API's, we won't be dealing with the views.

## `config`

This directory contains the configuration files that your application will need, including your database configuration (in `database.yml`) and the particularly important `routes.rb` which decides how web requests are handled. The `routes.rb` file matches a given URL with the controller which will handle the request.

## `db`

It contains a lot of database-related files. Most importantly the migrations subdirectory, containing all your database migration files. Migrations set up your database structure, including the attributes of your models. With migrations, you can add new attributes to existing models or create new models. So you could add the favorite_color attribute to your Person model so everyone can specify their favorite color.

## `lib`

Short for library. Contains code you’ve developed that is used in your application and may be used elsewhere. For example, this might be code used to get specific information from Facebook.

## `log`

See all the fun stuff that is written in the console where you started the Rails server? It is written to your development.log Logs contain runtime information of your application. If an error happens, it will be recorded here.

## `public`

Contains static files that do not contain Ruby code, such as error pages.

## `vendor`

A folder for software code provided by others (“libraries”). Most often, libraries are provided as ruby gems and installed using the `Gemfile`. If code is not available as a ruby gem then you should put it here. This might be the case for jQuery plugins. Probably won’t be used that often in the beginning.

## `Gemfile`

A file that specifies a list of gems that are required to run your application. Rails itself is a gem you will find listed in the `Gemfile`. Ruby gems are self-contained packages of code, more generally called libraries, that add functionality or features to your application.

If you want to add a new gem to your application, add `gem "gem_name"` to your Gemfile, optionally specifying a version number. Save the file and then run `bundle install` to install the gem.

## `Gemfile.lock`

This file specifies the exact versions of all gems you use. Because some gems depend on other gems, Ruby will install all you need automatically. The file also contains specific version numbers. It can be used to make sure that everyone within a team is working with the same versions of gems. The file is auto-generated. Do not edit this file.