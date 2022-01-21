This guide is similar to the last, but targets a frontend React application. Make sure you've done the previous CI CD Coverage coursework for a Ruby on Rails api backend before moving on.

All that being said, let's show off a little by getting a Code Climate test coverage percentage for our React apps!
___
Just as for Rails, we will use **Semaphore** and **Code Climate**. But as you've probable already guessed, we need to adjust the commands we make Semaphore execute. The **Code Climate** implementation is identical to the last guide, so go ahead and add your React repo and save the `CC_TEST_REPORTER_ID`
___

Go to Semaphore and create new project

Choose Node.js, closest to what we want to do

Customize the job tasks: 
```
sem-version node 16.13.2
checkout
curl -L https://codeclimate.com/downloads/test-reporter/test-reporter-latest-linux-amd64 > ./cc-test-reporter
chmod +x ./cc-test-reporter
./cc-test-reporter before-build
yarn install
yarn cypress:ci
```
Epilogue
```
./cc-test-reporter format-coverage -t lcov
```
Job passed
```
./cc-test-reporter after-build --exit-code 0
```
Job failed
```
./cc-test-reporter after-build --exit-code 1
```
Environment variables, note that there is only one this time around, can you think of a reason why?


Create new branch (this needs to match what you are calling yr repo on GH)

Run job on Semaphore

If all good, open a PR to see that it runs

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

