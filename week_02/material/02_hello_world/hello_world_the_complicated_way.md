
React is a popular JavaScript library for building user interfaces. It was created by developers at Facebook and has quickly become very popular among developers. One way to look at React is that it is the view layer for web applications (the V in Model - View - Controller), but it is much more than that. There are several concepts that React introduces that drastically changes the way you approach building web applications and user interfaces.

React allows you to create highly reusable UI components like checkboxes, radio buttons, dropdown lists, list boxes, buttons, toggles, text fields, date fields, etc. Each of these components, or custom HTML tags, can have their own functionality that displays relevant DOM elements. That is pretty convenient and makes web development more efficient and allows for richer user experience. If you want to know more about this library, head over to Facebook’s resources ["Why React?"](https://facebook.github.io/react/docs/why-react.html) and ["Why did we build React?"](https://facebook.github.io/react/blog/2013/06/05/why-react.html) as they thoroughly explain the technical design choices that make React particularly unique.

## A Hello World with a goal

Your first interaction with React will be to build a simple Hello World application, but not in the simplest way. Before we start building applications in React it is important that you understand the underlying structure and configuration that is needed for a React application to run. Later on in the course you will be using a scaffolder to create your React application with all the necessary setup done for you, but before we can leverage on the great work of others we need to get an understanding of what is going on under the hood. Therefor, you will setup your Hello World React application manually!

## The Setup

Start by creating a new folder for your React application. Then, initialize your project with `yarn init` (if you want to skip all the questions that follow when you issue that command, add the `-y` flag before you execute it).

Now is also a good time to initiate your git repository and make your first commit. Remember to commit often!

When our application will build, the source code will be placed in a specific folder (`dist`). Also, we will be installing a lot of external libraries that will reside in the `node_modules` folder. We want to exclude those folders from commits, so let’s go ahead and add a `.gitignore` file that will exclude those directories from version control.
```
$ mkdir react_portfolio
$ cd react_portfolio
$ yarn init -y
$ git init
$ touch .gitignore
$ echo -e "node_modules/\n.DS_Store\n.vscode\n" >> .gitignore
$ git add .
$ git commit -am "initiates project and adds gitignore scaffold"
```

## The Starting Point

In this exercise, we will build your React application and transpile it to executable code that will run on all browsers. Transpilers, or source-to-source compilers, are tools that read source code written in one programming language and produce the equivalent code in another language. Babel is a tool that helps us transpile JavaScript files from latest versions of JavaScript (ECMAScript) to the previous version so that it maintains compatibility against older browser versions. A bit simplified, you might say that everything you do in React must be translated to "vanilla" Javascript - and that Babel does that for us (more on Babel later)

We will be creating most of the files in our `src` folder, and since React is using ES6 features, let the before-mentioned tools (Webpack and Babel) compile it for us into the `dist` folder.

Create the following folder structure for your project:
```
react_portfolio
+-- dist
+-- src
```
We also want to create a starting point for our application. We need an `index.html` file (in the project's root folder) that will be loaded in the browser and hold our React application.

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:2500/https://www.filepicker.io/api/file/fDVijGfnTXWZH1qHyh7w)

The most important part of the code above is the `<div id="app"></div>` tag, which is the root our React application will hook into, but also the `script` reference to `dist/bundle.js` that will hold our compiled code. The rest is pretty much a standard HTML skeleton.

### Execution
```
$ mkdir src
$ mkdir dist
$ touch index.html
$ code index.html
// add the html code to index.html
```
## React as a dependency

To work with React, we need to install it. As simple as that. React can be added to your project using `yarn`(it's your choice, but be consistent.).

## Execution
```
$ yarn add react react-dom
```
## Babel and Webpack

As mentioned above, we need to make sure the code we write can be transpiled from ES6 to ES5, as not all browsers support ES6 yet.

### What is ES6?

ES6 (ECMAScript) is a new version of JavaScript that adds some nice syntactical and functional additions. It was finalized in 2015. ES6 is almost fully supported by all major browsers. But it will be some time until older versions of web browsers are phased out of use. For instance, Internet Explorer 11 does not support ES6, but has about 12% of the browser market share.

### What is JSX?

JavaScript eXtension, or more commonly JSX, is a syntax extension to JavaScript that allows us to write JavaScript code that looks like HTML. With JSX you can write HTML code in JavaScript and have Babel transform these expressions into actual JavaScript code.

More specifically, JSX is a shorthand for calling `React.createElement` function. Since it’s JavaScript, we can execute JavaScript code inside JSX using `{}` curly-brace syntax. More about that later.

All in all, we need to install Babel. Let's break it down a bit more.

`@babel-core` is the main Babel package used to do any transformations on our code. `@babel-cli` lets you compile files from the command line. The other two packages,`@preset-react` and `@preset-env`, are presets that transform specific flavors of code. The `@preset-env` preset transpiles ES6 into more traditional JavaScript (ES5) and the `@preset-react` preset does the same with JSX.

We need to tell Babel that we want to use those presets. In the project's root folder, create a file called `.babelrc` and add the following setting in Json:

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:2500/https://www.filepicker.io/api/file/bR8qh3E7S7KxC0UW5dMJ)

### Execution
```
$ yarn add -D @babel/core @babel/cli @babel/preset-env @babel/preset-react @babel/plugin-proposal-class-properties uglifyjs-webpack-plugin
$ touch .babelrc
// add the json code to .babelrc
```
_Please note that you might get Security Warnings/Alerts if you push to GitHub. Don't stress and follow the instructions. At the time we wrote this walkthrough, the fix was to install the following packages:_
```
$ yarn add -D eslint@^4.18.2 js-yaml@^3.13.1 webpack-dev-server@^3.1.11
```
The next step is to install and configure Webpack.

We need to install `webpack` as a development dependency and `webpack-cli` so that you can use webpack in the command line.

Webpack uses loaders to process different types of files for bundling. It also works easily alongside the development server that we’re going to use to serve our React project in development and reload browser pages on (saved) changes to our React components.

To get all of this up and running, we need to configure Webpack to use our loaders and prepare the development server (`webpack-dev-server`). The following is a working setup for the `webpack.config.js` - a file you need to create in the project's root folder.

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:2500/https://www.filepicker.io/api/file/MP32ILR6Sqid6Q3tU1PC)

There are many parts here that call for a closer look. Do not take this lightly.

-   `entry` tells Webpack where our application starts and where to bundle our files.
-   `mode` lets Webpack know we’re working in development mode and saves us from having to add a mode flag when we run the development server.
-   `module` is an object that defines how our exported javascript modules are transformed and which ones are included according to the given array of `rules`.
-   The first rule is about transforming ES6 and JSX syntax. The `test` and `exclude` properties are conditions to match files against. We will match anything that is NOT inside the `node_modules` folder. We also need to direct Webpack to use Babel.
-   The second rule configures how we will process CSS. At this point, we will not pre- or post-process our CSS. Meaning we just need to make sure to add `style-loader` and `css-loader` to the `use` property. Later on, we will take a closer look at SASS and will have to change these settings.
-   `resolve` allows us to specify which extensions Webpack will resolve — this allows us to import modules without needing to add their extensions.
-   `output` property tells Webpack where to put our transpiled and bundled code. The `publicPath` property specifies what directory the bundle should go in, and tells `webpack-dev-server` were to serve files from. If `publicPath` is set incorrectly, we would be getting 404 errors when running the app, since the server would not be serving your files from the correct folder.
-   `devServer` property configures the `webpack-dev-server` and specifies the location we will be used to serve static files from as well as the port we want to run the server on.

We also need to add a script to `package.json` to start the `webpack-dev-server`:

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:2500/https://www.filepicker.io/api/file/oY3GEeBBRO2M0AhTUFpQ)

## Execution
```
$ yarn add -D webpack@4.19.1 webpack-cli@3.1.1 webpack-dev-server@3.1.8 style-loader@0.23.0 css-loader@1.0.0 babel-loader@8.0.2
$ touch webpack.config.js
// add the javascript code to webpack.config.js
// add the json code to package.json
```
## Our first component - Hello World

Let's create an `index.js` file in our `src` directory, build our first component and hook it in into the DOM.

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:2500/https://www.filepicker.io/api/file/89Ukkr1RS0K81s2nZl6L)

## Execution
```
$ touch src/index.js
// add the javascript code to src/index.js
```
## See it come alive!

We can start our dev server by executing the `start` script in our terminal, wait until Webpack and Babel does their job, and see our application come alive in the browser:
```
$ yarn start
```
## [](https://github.com/CraftAcademyLabs/ca_course/raw/master/week3/portfolio_challenge/assets/react_portfolio_1_hello_world.png)Not quite there yet...

We are not quite done with our Hello World yet. I know, how long can we push this before we get into "real" development? Well, I would like us to do a little bit of refactoring so that we can showcase at least a bit of functionality that showcases the power of React.

Let's extract the Hello tag into a reusable component.

Let's create a new file in the `src` folder and call it `Hello.jsx`. I that file we will create out `<Hello />` component and reference it from `index.js`. This is the code we need to write:

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:2500/https://www.filepicker.io/api/file/D4dDTWNQwylzIDKuEDRF)

Consequently, we need to make some changes to the `index.js`. Read through the following code first, to make sure you understand what's going on, and replace the current content of `index.js`.

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:2500/https://www.filepicker.io/api/file/wsVmo8xOTguMBmglKbuA)

This is probably by far the most complicated "Hello World" that you have ever setup, but as mentioned, the purpose of this was to get a deeper understanding of how a React app is built before starting to work with it!