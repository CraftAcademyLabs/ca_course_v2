This guide is similar to the last, but targets a frontend React application. Make sure you've done the previous CI CD Coverage coursework for a Ruby on Rails api backend before moving on.

All that being said, let's show off a little by getting a Code Climate test coverage percentage for our React apps!
___
Just as for Rails, we will use **Semaphore** and **Code Climate**. But as you've probable already guessed, we need to adjust the commands we make Semaphore execute. The **Code Climate** implementation is identical to the last guide, so go ahead and add your React repo and save the `CC_TEST_REPORTER_ID`
___

Head over to **Semaphore** and create a new project, just the same as when you set one up for your Rails backend. Once you've selected the repo and added people you want to set up your workflow. Select the Node.js template, as it's the closest to what we want to do:
![](../images/semaphore_workflow_react.png)
You guessed it, we have to edit the jobs section:
![](../images/semaphore_workflow_dashboard_react.png)


Edit it as follows: 
```
sem-version node 16.13.2
checkout
curl -L https://codeclimate.com/downloads/test-reporter/test-reporter-latest-linux-amd64 > ./cc-test-reporter
chmod +x ./cc-test-reporter
./cc-test-reporter before-build
yarn install
yarn cypress:ci
```
Change the `Epilogue` to this:
```
./cc-test-reporter format-coverage -t lcov
```
Then the `job passed` to:
```
./cc-test-reporter after-build --exit-code 0
```
And the `job failed` to:
```
./cc-test-reporter after-build --exit-code 1
```
Now look at the environment variables. This time around we only need one, `CC_TEST_REPORTER_ID`, and just like before you get it from **Code Climate**, though make sure that you get it from the frontend repo project on Code Climate!

Now we want to run the workflow. Edit the branch name to `development` if that is what you are using on your github. Go ahead and start it:
![](../images/semaphore_run_workflow_react.png)

Now this will of course fail. This is because we have issued a bunch of commands on Semaphore that are not yet integrated with our app. Let's fix that next!

___

Code Coverage: 
1st we have to add Istanbul.js, custimize-CRA. As development dependencies add @cypress/code-coverage, babel-plugin-istanbul

useBabelRc()

mount code coverage in support/indexjs

cypress/plogins module.exports

modify scripts in package.jso

Sanity check: open lcov report. Celebrate win

Commit and push up, merge

new branch

