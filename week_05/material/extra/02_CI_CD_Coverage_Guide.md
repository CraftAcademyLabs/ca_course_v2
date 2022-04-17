The following guide assumes that you have an upstream repository on Craft Academy's Github account, if that is not the case for you then just ignore the parts about adding the "Craft Academy repository" and set your repository there instead. It also assumes that you're using RSpec for testing Ruby on Rails and Cypress for a React client.

In this guide, we will show you how to set up three services that will work together, Semaphore, CD with Heroku and Code Climate.

**Semaphore** is testing your code all the time and keeping software quality high. The premise of CI is to get feedback as early as possible because the earlier you get feedback, the easier things become to fix.

In software development, when multiple developers or teams are working on different segments of the same web application, we need to perform an integration test by integrating all modules. To do that an automated process for each piece of code is performed on a daily basis so that all your code gets tested.

**Continuous Deployment with Heroku** is about getting code into production in an automated way. Things should be easy and repeatable. That’s where Continuous Deployment comes into play. The deployment should not be manual. Every time we add some new code to our application it should deploy that new code automatically.

**CodeClimate** is a web service to help you track your code coverage over time, and ensure that all your new code is fully covered. You can use it for various programming languages and in this guide, we will use it for Ruby. In a later guide we will use it to measure code coverage in React.

# Coverage with Code Climate
Code Climate can automatically track your coverage, but it relies on separate tools to do the actual analysis of how much of your code is being tested. Add the following gem to your `Gemfile` in the `:development` and `:test` group

```rb
group :development,  :test  do
  gem 'simplecov',  require:  false
end
```

``Run bundle install``

Next, we need to add simplecov to our testing suite. Add the following lines at the top of the `rspec` configuration file

```rb
# spec/rails_helper.rb for RSpec

require  'simplecov'
SimpleCov.start
```

Now whenever we run our tests, a coverage report will be generated. *NB: Do not track this report in version control! You will need to add the following to your gitignore:*
```
# .gitignore

coverage/
```
Now let's head over to [Code Climate](https://codeclimate.com/) and set up a free account. Code Climate offers two services, Velocity and Quality. We are interested in the latter:
![](../images/codeclimate_landing_page.png)
Don't bother with the 14 day trial, open source is where it's at (you may need to give access to the specific repository you want to work with, if you run into trouble contact a coach):

![](../images/codeclimate_welcome.png)

Let's add the repo we are working with:
![](../images/codeclimate_dashboard.png)
All the repos you have access to should appear as follows:
![](../images/codeclimate_repos.png)
After selecting your repo, Code Climate will work through it and hopefull display something in line with the following:
![](../images/codeclimate_success.png)
If you navigate to your repo will be served with an overview. Our goal is to populate the "test coverage" with a percentage. Our first step on this journey is to head over to the "Repo Settings":
![](../images/codeclimate_settings.png)
In "Repo Settings" head over to "Test Coverage":
![](../images/codeclimate_repo_settings.png)
Scroll down and copy the `Test Reported ID`, you will need it later on:
![](../images/codeclimate_test_reporter_id.png)
----------

# Setting up Continous integration with Semaphore
With the Code Climate Test Reported Id in our back pocker, we need to set up CI using SemaphoreCI

Visit the Semaphore's [website](https://semaphoreci.com/). 

![](../../../week_05/material/images/semaphore_landing_page.png)

If you don't already have an account, set one up with Github

When signing up you might be blocked by an 'abusive-filter'. If this is the case, you'll have to send a mail to that specified address in the error message. Make sure to include your GitHub email in that message!   

### Setting up a new project
- Click the "Create new" button and then "Choose repository".

![](../../../week_04/material/images/semaphore_dashboard.png)

- At this stage you should have been prompted to give Semaphore access to your GitHub account. If by some reason you still don't see any repos, go to your profile settings up in the right corner and check permissions. Make sure to check both in "GitHub App" and "Github Personal Token". If your Public repos are indeed connected, but you still don't see anything - contact a coach!
- Proceed to select the repo you want to use.

![](../images/semaphore_choose_repo.png)

- Semaphore will ask you if you want to add people to the project. Don't worry if not everyone on your team is signed up, this can be done at a later stage.

![](../images/semaphore_add_people.png)

### Workflow

- Now we need to configure the test environment. Choose the "Ruby on Rails" starter workflow and then click "Customize".

![](../images/semaphore_workflow.png)

- We are interested in editing the "jobs" part first to suit our project.

![](../images/semaphore_customize.png)

Inside the this container, replace the content with this:

```
checkout
sem-service start postgres 11
sem-version ruby 3.0.0
curl -L https://codeclimate.com/downloads/test-reporter/test-reporter-latest-linux-amd64 > ./cc-test-reporter
chmod +x ./cc-test-reporter
./cc-test-reporter before-build
bundle update --bundler
bundle install
bundle exec rails db:create db:migrate
bundle exec rspec
```
Wow that's a lot! Let's go through it to make sure we know what Semaphore will do. The first three lines tell Semaphore what version of Postgres and Ruby to use. If your project uses a different version than 3.0.0 go ahead and change it, but leave Postgres as version 11. The following four lines come from the CodeClimate [documentation](https://docs.codeclimate.com/docs/semaphore-ci-test-coverage-example) and ensures CodeClimate can read the coverage report that `Simplecov` spits out. The final four lines should look familiar at this point. They update `Bundler` to the latest version, installs all the Gems in your `Gemfile` and create the database (NB: We do not need to seed the database for test coverage, that is why we're not running `rails db:setup`). Finally it tells Semaphore to run `rspec`.

But we're not quite done. We need to edit the "Epilogue" and "Environment variables" before we run anything. Let's start with the epilogue.
![](../images/semaphore_epilogue.png)
In "Execute always" we want:
```
./cc-test-reporter format-coverage -t simplecov -o  coverage/.resultset.json
```
In "If job has passed" we want:
```
./cc-test-reporter after-build --exit-code 0
```
In "If job has failed" we want:
```
./cc-test-reporter after-build --exit-code 1
```
Great! Now let's look at the environment variables.
![](../images/semaphore_env_var.png)
`DATABASE_URL` and `RAILS_ENV` were generated by Semaphore's Ruby on Rails template, there is no need to change them. Instead we're going to add a third variable: `CC_TEST_REPORTER_ID`. Do you remember the Code Climate setup we did above? You guessed it, this variable should be set to the "Test Reporter ID" provided to us by Code Climate.

Now "Run this workflow" which should initiate a new test run. If you have any strange errors here, contact a coach. You will probably have to rename the branch that the build is happening from to `development` or whatever you've called your development branch on Github.

- And voila!

![](../images/semaphore_success.png)

This process will create a PR to the chosen repo. Make sure to get this PR merged (by you or the coaches) and then pull down to your local project to make sure the new ``semaphore.yml`` file will be added in future PRs.

Now, as the final thing, head over to the project's settings tab, scroll down and make sure to tick in these two checkboxes. Just go with the default settings of the "Forked pull requests".

![](../../../week_04/material/images/semaphore_PR.png)

As a sanity check, head over to Code Academy and if all's gone well you should be seeing your code coverage (try to figure out how to grab a badge of your coverage and add it to your github's `README.md`):
![](../images/codeclimate_coverage.png)

# Setting up Continous Deployment with Heroku

- You need to have created a Heroku application, we will go over this in a demo this week. If we have not delivered that demo yet, skip this part for now.

- Go to your Heroku dashboard and click on ur project.

- Go to the deploy settings tab and activate Github as the applications deployment method

- Underneath that option you should now be able to connect the Heroku application to a specific repo(your rails_demo application).

![](https://raw.githubusercontent.com/CraftAcademyLabs/ca_course/master/guides/coveralls-ci-cd/assets/11_heroku-deployment-method.png)

- Now you need to decide which branch you want to be deployed, pick the main branch

- Now click the button that says "Enable Automatic Deploys"

![](https://raw.githubusercontent.com/CraftAcademyLabs/ca_course/master/guides/coveralls-ci-cd/assets/12_heroku-automatic-deploys.png)
![](https://raw.githubusercontent.com/CraftAcademyLabs/ca_course/master/guides/coveralls-ci-cd/assets/13_heroku-auto-deploy-enabled.png)

**DONE!!**
