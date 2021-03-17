
## Setting up Continous integration with Semaphore

Visit the Semaphore classic, make sure that you are not on Semaphore 2s [website](https://semaphoreci.com/). 
![](https://raw.githubusercontent.com/CraftAcademyLabs/ca_course/master/guides/coveralls-ci-cd/assets/01_semaphore-pick-classic.png)
- If you don't already have an account, set one up with Github
- First thing, we need to make sure that we are using the latest version of Ruby that Semaphore supports
- Go [Here](https://classic-docs.semaphoreci.com/docs/languages/ruby/ruby-support-on-semaphore.html) to see which version to use
- Then go to your `.ruby-version` file to make sure that you are using the `Ruby version` that Semaphore supports
- _If you are using the same version as the latest one Semaphore supports, then jump to the step where you add a new project_
- If you have a different `Ruby version` on your project, then change it in your `.ruby-version` file and `Gemfile` 
- For example, if the latest `Ruby version` that Semphore supports is `ruby 2.5.1` then it should look like this: 
```
# .ruby-version

ruby-2.5.1
```
```
# Gemfile

ruby '2.5.1'
```
- After changing `Ruby version`, delete your `Gemfile.lock`
- Then you need to install the correct version and change to that version:
```
$ rvm install the_ruby_version_you_changed_to
```
```
$ rvm use the_ruby_version_you_changed_to
```
- And then you need to reinstall your dependencies with the new `Ruby version`:
```
$ bundle
```
- Now you are all set with your new `Ruby version` and should `commit` and `push` up to your repo before continuing.  

- Click the button to add a new project
![](https://raw.githubusercontent.com/CraftAcademyLabs/ca_course/master/guides/coveralls-ci-cd/assets/02_semaphore-add-project.png)
- Find the repo (`rails_demo`) you want to add CI to in the list which shows your own repositories
![](https://raw.githubusercontent.com/CraftAcademyLabs/ca_course/master/guides/coveralls-ci-cd/assets/03_semaphore-select-repo.png)
- When they ask you who is supposed to own this project, pick `Craft Academy` if you can.
![](https://raw.githubusercontent.com/CraftAcademyLabs/ca_course/master/guides/coveralls-ci-cd/assets/05_select-owner.png)
- After you selected the repo you want to use you should be able to set which branch we want CI for, usually the development branch but in your case we want to pick the master branch. The branch you will merge feature branches in to.
![](https://raw.githubusercontent.com/CraftAcademyLabs/ca_course/master/guides/coveralls-ci-cd/assets/04_semaphore-select-branch.png)
- After you have selected the branch and semaphore has analyzed the project, you are presented by some options.
![](https://raw.githubusercontent.com/CraftAcademyLabs/ca_course/master/guides/coveralls-ci-cd/assets/06_semaphore_analyzing-repo.png)
- You usually don't have to change the `Language`, but make sure that the `database.yml` option is set to `pg` and that you choose the `Ruby version` that you set up before.

- First off delete both of the jobs, we only want the setup.

- Edit the setup and put this in there
```
nvm install 13.7.0
nvm use 13.7.0
gem update --system
gem install bundler
bundle install --path vendor/bundle
yarn
bundle exec rails db:setup --all db:migrate
bundle exec rails db:test:prepare
COVERALLS_REPO_TOKEN=your_coveralls_token bundle exec rails ci:tests
```
- Make sure to get the repo token from coveralls project and reålace the placeholder in the code example.
![](https://raw.githubusercontent.com/CraftAcademyLabs/ca_course/master/guides/coveralls-ci-cd/assets/07_semaphore-project-settings.png)
- Now go ahead and build with these settings. ![](https://raw.githubusercontent.com/CraftAcademyLabs/ca_course/master/guides/coveralls-ci-cd/assets/08_semaphore-build-with-settings.png)
- You have now successfully added CI with semaphore to your project. Don't worry if it does not go green now from the start.
![](https://raw.githubusercontent.com/CraftAcademyLabs/ca_course/master/guides/coveralls-ci-cd/assets/09_semaphore-complete.png)