
Add the following gem to your `Gemfile` in the `:development` and `:test` group

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:2500/https://www.filepicker.io/api/file/GRFJ7vAoR6zCZhfOog8p)

Run bundle install

Next, we need to add coveralls to our testing suite. Add the following lines at the top of the `rspec` configuration file

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:2500/https://www.filepicker.io/api/file/ypUQWTyiTFSjOu2MUyHE)

Now whenever we run our tests, a coverage report will be generated.

----------

### Merging multiple test suites results

We need to prevent coveralls from sending data right after running each test.

Instead, we want to wait until coverage has been merged before we send it off.

For that, we’ll modify the configuration with the following

instead of
```
Coveralls.wear!('rails')
```
we should use
```
Coveralls.wear_merged!('rails')
```
When you run your tests coveralls will create coverage reports in folder named `coverage`. We do not want to push that up to Github. Make sure you add `coverage/` to your `.gitignore`

Then create a custom rake task that will run all your test suites then submit coverage results to coveralls.

Create a new file `lib/tasks/ci.rake`

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:2500/https://www.filepicker.io/api/file/XmjmnEuKQmy6UV0ZEWVh)

Now on you can run the following command on CI to execute all your tests suites
```
$ bundle exec rails ci:tests
```
At this point, you have added the code necessary to make coveralls work.

Now you need to visit the [Coveralls website](https://coveralls.io/) and add your project to use their service.

If you haven’t created an account already, please sign up using your Github account.


![](https://www.filepicker.io/api/file/x2i78OolTumUoKXDckEA)

Once you are logged in you need to get to the page where you can add new repositories. Go to the sidebar and click on “Add repos”

![](https://www.filepicker.io/api/file/738t6RhOQVyk5BSmP8du)

The first thing that you want to do is to click on the sync repos button in the top right corner.  

![](https://www.filepicker.io/api/file/bxBAQKR9pANnx8DInXAs)

Now you can search for the repository that you want to add “Coveralls” to. When you find it you need to enable it.

![](https://www.filepicker.io/api/file/sURTnZLHSsmVJlNADFso)

At this point, we have successfully added coveralls to our project.  
If you need to have the coveralls token for continuous integration (Semaphore), click on the Details button.

If you recently added coveralls to the repository you will be presented by the coveralls  `repo_token`  straight away. If you don’t see it when you press details. Then you have to go to the settings for this project to find the coveralls  `repo_token`.  

![](https://www.filepicker.io/api/file/8OFw0T2uT0aHm1KiV2tM)

![](https://www.filepicker.io/api/file/FXPGZifRdyPONkPf4PAR)