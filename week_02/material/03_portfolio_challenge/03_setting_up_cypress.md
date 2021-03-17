
## Installing Cypress

Cypress is a tool used for testing software. It runs automated acceptance tests written in a behavior-driven development (BDD) style.

Cypress is a complete Acceptance test/E2E Testing framework.

Acceptance tests help you to make sure that your application does what it is supposed to do when a user interacts with it.

It requires limited knowledge about the implementation itself.

Cypress gives us a few options on how we can install it, if you check the [Cypress-docs](https://docs.cypress.io/guides/getting-started/installing-cypress.html#System-requirements) you can read about the different ways to install it, we, however, are going to install Cypress with Yarn.

Let’s add Cypress using yarn and some dependencies to our project.
```
$ yarn add cypress --dev
```

Installing packages with yarn using the `--dev` option will save the packages as devDependencies. After executing the above command your package.json file will look something like this:

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:2500/https://www.filepicker.io/api/file/nb5vCX0xQmOFVWPkpzJ4)

Our next step is to make sure Cypress is working correctly. To use Cypress to test our application correctly we need to have a server running.

So let’s get into it.

First lets set up Cypress, in your terminal run:

```
$ yarn run cypress open
```

When the set up is completed (it shouldn’t take too long) you will notice a little browser window popped up.

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:2500/https://www.filepicker.io/api/file/AfviDurbQPWh1C1ZBcCz)

Just go ahead and click the `OK, got it!` button.

You will now see the browser that Cypress will be using to run our tests. Cypress adds a lot of folders and example tests.

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:2500/https://www.filepicker.io/api/file/PkF2578cQb21fNbUBGKY)

You can see a button in this browser window Run all specs this is how we are going to run all the tests we right for this application.

If you want to run all the example tests that get installed with Cypress go ahead and hit the Run all specs button and get to know the way Cypress works.

When you are ready just close this browser and you will see the terminal went back to normal.

Let’s return to our code editor
```
$ code . 
```
We can now see that Cypress has added some new folders & files for us, let’s have a look through them and understand what is going on.

If we click on the `cypress` folder you will see that there are a few more folders within it.

## Cypress Folder structure

So before we move on we need to go over the way that Cypress structures its folders and the folders that we are going to use to test our application.

If you click on the cypress folder in VSC, it will drop down and show you 4 new folders.
```
cypress 
    >fixtures 
    >integration 
    >plugins 
    >support 
```
### Fixtures

In this project, we are only going to use one of these folders to keep our tests in, but it is good to know what is going on.

Fixtures are used as existing static data pieces that your tests can use. By default, fixture files are located in `cypress/fixtures`, but they can be configured to a different folder.

### Integration

This is the folder that we are going to use the most. Cypress by default looks for all the tests we create and write in this folder. Any of the tests we do write have to have `.spec.js` or `.feature.js` at the end of the files, we will go over this later when we start writing our tests.

If you open the integration folder now you will see another folder called `Examples` with quite a few examples tests in it. This by default is installed with Cypress, read through them and when you are finished just delete the `Examples` folder we will not need it after this point.

### Plugins

By default Cypress will automatically include the plugins file `cypress/plugins/index.js` before every single spec file it runs. It does this purely as a convenience mechanism so you don’t have to import this file in every single one of your spec files.

Plugins enable you to tap into, modify, or extend the internal behavior of Cypress.

Normally, as a user, all of your test code, your application, and Cypress commands are executed in the browser. But Cypress is also a Node process that plugins can use.

### Support

The last folder we will look at it is the support folder.

The support file is a great place to put reusable behavior such as Custom Commands or global overrides that you want to be applied and available to all of your spec files.

You can define your behaviors in a `beforeEach` within any of the `cypress/support` files.

## Add custom script for Cypress

Alright, let’s move on, as mentioned previously, we need to have a server running to use Cypress.

We need to add a script in the package.json file.

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:2500/https://www.filepicker.io/api/file/9r8GRS3MQQ6BCEPGOrmW)

The script we added will run the script that starts the server and open up `Cypresss`.

So in your terminal you can run:
```
$ yarn cy:open
```

We have now successfully added `Cypress`.