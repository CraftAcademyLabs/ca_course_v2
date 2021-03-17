
Let’s move on with our Portfolio AND learn about React in the meantime. Don’t forget why we are doing this - having a portfolio site is fun, and that is why we chose to build one for this exercise. But the real reason we are doing all of this is to learn to build engaging user interfaces with React.

The endgame for this section of the course is this:

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:2500/https://www.filepicker.io/api/file/WS9NJyMAQ1uq64MyCgtD)

We want to add a header and a footer to our application, and we want to add a little bit of styling to it. With that foundation, we will be able to move on and add some content to our portfolio site.

## Create the page structure

If you look at the screenshot above, you can see that the application has changed since we left off in the previous section. We now have a header, the main content area (the “Hello World” part. Yes, we WILL remove it soon enough) and a footer section.

We will make the changes to our code by creating 2 new components (a `Header` and a `Footer` component), reference them from our `App` component and display them in our app. Finally, we will add a CSS framework (Semantic UI React) and style our application a bit.

The first thing we want to do is create a `Cypress` test based on that screenshot.
```
$ touch cypress/integration/userCanSeePortfolioStructure.feature.js
```
![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:2500/https://www.filepicker.io/api/file/cSH7h80S3CgTecw5xn9q)

That is our test, let’s get to writing some code.

Let’s start by creating three new files in our `src` folder, `Hello.jsx` `Footer.jsx` and `Header.jsx`. In the first iteration, we can just add some basic text. We WILL style them in a moment.

This is the code for `Hello.jsx`:

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:2500/https://www.filepicker.io/api/file/HMCIKi6wRJq1QD4FPzYF)

This is the code for `Header.jsx`:

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:2500/https://www.filepicker.io/api/file/4utPc84FQxucFw5nkbVL)

And this is how we will define the component in `Footer.jsx`:

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:2500/https://www.filepicker.io/api/file/4MJh5F1QRWUO6czqowH4)

Consequently, we want to change the markup in our `App.jsx` component to include and reference our new components:

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:2500/https://www.filepicker.io/api/file/lZIqn1T2THqDyRoVG9KR)

Now, restart your development server to see the new components in action. They should be visible, but not impress you a lot.

If you run the `Cypress` test everything should go green. Right? It’s time to add some styling to our application.

## Adding a CSS framework

We will make use of [SemanticUI](https://semantic-ui.com/introduction/getting-started.html) to add a look and feel to our application.

Let’s start by adding SemanticUI as a dependency first, then do a bit of configuration, and finally, make use of SemanticUI to style our application.

There is a special integration of Semantic UI specially made for React that is called [Semantic UI React](https://react.semantic-ui.com/). Since we are working with React then that seems like the way to go.

Semantic UI React is a component based styling framework, which means that we can import custom made HTML elements from Semantic UI to get the styles that we want. Please have a look at the [official documentation](https://react.semantic-ui.com/) to see all the different elements that you can use and choose from.

### Setup

The first thing we need to do is to add the packages for Semantic UI and Semantic UI React.

Run this in your terminal:
```
$  yarn add semantic-ui-react semantic-ui-css
```
After that, we need to import a minified CSS file to our app’s entry file. In our case when working with React, that file is our `index.js`:

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:2500/https://www.filepicker.io/api/file/iRKbjZonTbeVQhR1eoSw)

This will make the latest version of Semantic UI React available in your project.

## Styling

Semantic UI comes with a LOT of predefined classes and in our case custom made elements and that can be a bit overwhelming. While writing this documentation, I did spend some time on [CodePen](https://codepen.io/) looking for some good UI examples to look at. I came up with the following styling that you are welcome to use (You can, of course, give your portfolio your own look and feel by combining the available classes on your own, or write some on your own).

I deliberately left the  `index.css`  when we did the clean up of the scaffold, so that we could make use of that file now.

So in your `index.css` file, add this piece of css:

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:2500/https://www.filepicker.io/api/file/vJ7NEMrrQAKKmlHZV6oq)

Now, we will have to make use of the Semantic UI React elements and our own custom css in our components. We do that by modifying the `return` of our components with the following markup examples:

This is the code for the `Header.jsx`:

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:2500/https://www.filepicker.io/api/file/7tdAolazRfapr9Bs7Sy9)

And for Footer.jsx:

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:2500/https://www.filepicker.io/api/file/IfasBAdfRSqc5tMplujc)

And for Hello.jsx:

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:2500/https://www.filepicker.io/api/file/IguaR423S4qHHe7LNudb)

## Wrap up

In this section, we started to set up the structure of our application by creating a few new components and displaying them on the page. We also added a CSS framework, gave our components a look and feel and made sure that we can reuse the classes.

That’s good progress - we are getting somewhere.

But in our current implementation, we are making use of a mix of Semantic UI elements and custom css. It is important to remember that when doing that we can come to a point where we start to override the CSS we get from Semantic UI too much, and then the styling will break completely. The reason why we use a styling framework is to save time and not have to spend too much time on styling, so make use of Semantic UI over writing your own CSS.

In the next part, we will look into navigating within our portfolio (we will add an “About Me” and “My Projects” sections).