
As our portfolio application is taking shape. In the previous section, we added a header and a footer to the page structure. Now, we want to extend our application with an “About Me” and a “Projects” section. There are many ways to achieve that, but for learning purposes, we will take a path that requires us to add dynamic routes to our application. The result we are looking for is something like this:

![](https://www.filepicker.io/api/file/0tQjFq1FTAul5MMzv0qC)

## Router - the concept

Single-page applications (like the one we are building) rewrite sections of a page rather than loading entire new pages from a server. There are many examples of applications that do not render the entire page when you click a link or request new information from the server in another way. You’ve probably encountered this functionality on many of the popular sites out there.

A router allows our application to navigate between different components, changing the browser URL, modifying the browser history, and keeping the UI state in sync. Routing is of uttermost importance in almost every application’s architecture. The larger your app becomes, the more your routing functionality becomes complex, from simple to deeply nested routing scenarios.

As mentioned before, at its core React focuses only on building user interfaces, it doesn’t have a built-in solution for routing.

[React Router](https://reactrouter.com/) is the most popular routing library for React. It allows us to define routes in the same declarative style. The Route component is perhaps the most important component in React Router to understand and learn to use well. Its most basic responsibility is to render some UI when a location matches the route’s path.

React Router provides two Routers for us to use: `BrowserRouter` and `HashRouter`. We need to decide which one to use, and the choice will mostly depend on our server architecture.

`BrowserRouter` is the recommended default, but it may require additional server configuration to handle dynamic requests. `HashRouter` is not suitable for all situations, but it can be a good solution for static websites.

In our Portfolio application, we will use `BrowserRouter` as our Router of choice.

In the following section, we will use some of the basic functionality React Router brings to the table. If you want to go deeper into the router visit [this resource](https://reactrouter.com/core/guides/philosophy) and read through the documentation and examples.

## Writing the test

The first thing we want to do is to add another integration test. Our user should be able to click through different tabs.
```
$ touch cypress/integration/userCanNavigateThroughTheApplication.feature.js
```
![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:2500/https://www.filepicker.io/api/file/ZpHnruCQFO7svMtgXijA)

We test that the user can click through the tabs and see the content that is expected to be there. We are also making sure that we cant see the elements that are supposed to be visible on the other tabs, to make sure that the navigation works properly.

The test above is not how we want to structure our test. As we have mentioned previously, we only want ONE assertion for a single it block. The correct way of structuring this test looks like this.

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:2500/https://www.filepicker.io/api/file/sIUaBV4TGKDKuUwCniF5)

Let’s make these tests go green!

## Getting started

As with every package, we will add the router using yarn and save it as a dependency.
```
$ yarn add react-router-dom 
```
We want to add 2 new components to our application. We will create them in `About.jsx` and `Projects.jsx` (in the src folder).

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:2500/https://www.filepicker.io/api/file/y9L1FWp6R6aKuEO09Gfr)

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:2500/https://www.filepicker.io/api/file/Fes0HOUfTSuz95ZRom6g)

We also want to `import` the `react-router-dom`, into our `index.js`.

Furthermore, we need to tell the application that we will be using the `BrowserRouter` when we hook the application into the `index.html`. We need to modify the `ReactDOM.render` function in `index.js` to the following markup:

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:2500/https://www.filepicker.io/api/file/iBJfsvVTSaiMwIka8J9g)

## Switch and Route components

React Router has, among others, the `Switch` and `Route` components. The `Route` component renders a page if the current URL location matches the path prop specified in it. It also accepts `component`, `render` and `children` props. `Switch` will avoid inclusive route rendering and include a catch-all Route (if we add one at the bottom of the container).

We need to import both these components along with our components that we want to navigate to into our `App.jsx`.

We will put them to use in our `return` of our `App` component.

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:2500/https://www.filepicker.io/api/file/USkhnQTaGS2xqkyWQZw8)

## Link and NavLink components

As the last step, we need to display some links in our `Header` component. We will use the `Link` and `NavLink` components (for learning purposes). Both of them are made available for use by the React Router package.

The `Link` component provides declarative, accessible navigation around an application. `NavLink` is a special version of the `Link` that will add styling attributes to the rendered element when it matches the current URL. We can style the active link using `activeClassName` or `activeStyle` prop.

We need to `import` both components to our `Header.jsx`.

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:2500/https://www.filepicker.io/api/file/CzHfLaQ46eVC2zKUXbA6)

And add them to our render function.

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:2500/https://www.filepicker.io/api/file/oCWFhBBERCCPrqvkLkAy)

## Wrap up

Run the tests now and everything should go green! We now have basic navigation in place. Moving forward, we will start filling our portfolio with content.