Go to this link and “fork” [this repository](https://github.com/CraftAcademy/atm_challenge_2019) by clicking on the fork button.

This will create a copy of the atm_challenge repository on your account (make sure of this by looking at the title of the repo). The next step is to click on the clone or download button. Copy the link and move over to your terminal. Navigate to an appropriate folder and “clone” the repo by adding the repo link to the following command:
```
$ git clone repo_link
```
Hit enter in your Terminal and cd into the downloaded atm-folder.
```
$ cd atm_challenge_2020
```
As mentioned above, we need to set up the necessary tools we’ll be using. We know that we’ll be using Ruby as the programming language. That is already set up on our system.

As a programmer
In order to produce good quality code
I want to work in a test driven way and unit test my code

We also know that we’ll be trying to write our application using Test Driven Development - or at least try to do that. For that, we’ll need a testing framework. Enter RSpec - the most frequently used testing library for Ruby applications. Even though it has a very rich and powerful DSL (domain-specific language), at its core it is a simple tool which you can start using rather quickly.

In order to be able to use it we need to install it. There are two ways to install libraries (gems). A direct install from your terminal (`gem install rspec`) or by adding a gem as a dependency to your application using [Bundler.](https://bundler.io/) It is pretty simple, you just add a gem to a specific file named `Gemfile`.

Let’s do that.

Create a new `Gemfile` from your terminal in the folder that you want to use for your application.
```
$ touch Gemfile
```
Add the following content to that file.

_Gemfile_

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/xOdHe3VBSmef98G6dTse)


Save and head over to your terminal window and run the `bundle install` command.

If you get an error message and the system complains about not finding Bundler, just run this command to install it:
```
$ gem install bundler
```
Please note that the gem name is `**bundler**`, while the command used to run it is `**bundle**`.
And run `bundle install` again.
That installs RSpec.

The next step is to initialize RSpec and configure it for our needs.
```
$ rspec --init
```
Edit the `.rspec` file and add --format documentation to see a more verbose rspec output. Your `.rspec` file needs to look like this.

_.rspec_
```
--format documentation
--color
--require spec_helper
```
Now, if you go back to your terminal and run the rspec command, you should see something like this.
```
$ rspec
No examples found.

Finished in 0.00028 seconds (files took 0.40297 seconds to load)
0 examples, 0 failures
```
Alright, that means we are set and ready to test.