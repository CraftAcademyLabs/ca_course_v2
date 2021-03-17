
In this section, we will focus on the `My Projects` display. We will take a closer look at how we can fetch some data (about projects) in JSON format, pass that data into the `render()` function, and display it in the browser.

Until now, we’ve only created stateless components (stored in functions). Now, we need to unleash some other powers that come in React. Components defined as classes are stateful, and provide more features that will be useful to us. To define a React component class, you need to extend `React.Component` (or simply `Component` if you import it as a module - more on that below.).

## Extending React.Component vs creating a function

Take a closer look at these 2 examples:

Using const:

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:2500/https://www.filepicker.io/api/file/djkk0qkUSSuZNj2WZQRU)

Using class:

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:2500/https://www.filepicker.io/api/file/YQGJHLTiGLDWdmvLlmTg)

What is the difference? Well, if you need to use any lifecycle events or set any state you should use class. What are lifecycle events? Let’s take a look at that.

## Component lifecycle events

As mentioned above, components can be defined as classes or functions. The methods that you can use on these are called lifecycle events. These methods can be called during the lifecycle of a component, and they allow you to update the UI and application state. Mounting, Updating, and Unmounting are the three phases of the component lifecycle.

### Mounting

The mounting phase is when an instance of a component is being created and inserted into the DOM. Apart from the `constructor()`, we have access to two lifecycle methods in this phase: `componentWillMount`, and `componentDidMount`.

-   `constructor()` is the first function called upon instantiating a React class and is where the initial state of the component is being set. If we only use the constructor to set the state we can use a shortcut provided by React. We can leave out the constructor and just say `state = {}`.
-   `componentWillMount` is called only once in the component lifecycle, immediately before the component is rendered (marked for deprecation in future releases of the library, please use `componentDidMount` below instead).
-   `componentDidMount` is also only called once, but immediately after the `render()` method has taken place. That means that the HTML for the React component has been rendered into the DOM and can be accessed if necessary.

### Updating

Anytime a component is updated or state changes then it is re-rendered. These lifecycle events happen during updating in this order.

-   `static getDerivedStateFromProps` enables a component to update its internal state as the result of changes in props.
-   `shouldComponentUpdate` allows your Component to exit the Update life cycle if there is no reason to apply a new render.
-   `render` create elements (generally via JSX) and return them. Unlike any other method in the Life Cycle, `render()` is the one method that exists across multiple life cycle phases. It occurs in Mount as well as in Update phases.
-   `componentDidUpdate` called every time a re-render has been performed, such as when `this.setState()` is called.

### Unmounting

The unmounting (or deletion, or “cleanup”) phase of the life cycle, called when a component is being removed from the DOM. During this phase `componentWillUnmount` is the only lifecycle event we can call.

Now that we have more knowledge about the lifecycle events, we can move on with building our application.

## Writing the test

In this section, we will list some projects on the `My Projects` tab. So we need to write a test for that. The projects will have a name and a description.
```
$ touch cypress/integration/userCanSeeListOfProjects.feature.js
```
![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:2500/https://www.filepicker.io/api/file/ZL92DGDvSWevG7uDQbNR)

Every project will be wrapped in a div where we will use the `id` of the project as a way of making every div unique. Then we will look within that div to make sure it displays the correct information.

## Projects in JSON

We will make use of the shortened version of the `constructor()` and `componentDidMount` event in our implementation to display information about our projects. For that reason, we need to refactor our `Projects` component from a stateless component and use `class`. For starters, let’s make the following changes to `Projects.jsx`. We will go over what is going on in the code

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:2500/https://www.filepicker.io/api/file/6jgfyHsOStGc2KgpbfFl)

What we in the code above is the following:

1.  We change the component from a stateless function to a stateful class.
2.  We are setting the initial state for projects to hold a simple JSON object that describes our projects. We give each project an `id` and `name` key with values.
3.  We modify `the render()` function and:

-   We save `this.state.projects` in a constant (`projects`)
-   We declare a new variable named `projectsList`(we will store some HTML in that variable in a moment)
-   We iterate over `projects` using `.map` function and create some HTML that holds a `key` and the name of the project wrapped in a `<h3>` tag that we store in `projectsList`.
-   And finally, we render some HTML and make use of the `projectsList` in the `return` - that will be what the component will look like in our UI.

The `key` calls for a closer explanation. A `key` is a special string attribute you need to include when creating lists of elements. Keys help React identify which items have changed, are added, or are removed. Keys should be given to the elements inside the array to give the elements a stable identity. In our case, we use the value of the projects `id` to set the key.

## Fetching data from a file

Having information about our projects hardcoded in the components `constructor()` does not feel good. Imagine if the project information would consist of a more complex dataset? We will take another approach and store the project information in a file and fetch it into our `Projects` component. We will use an external library called `axios` to read a JSON file that we will create in a new subfolder to the `public` folder that we will call `data`. [Axios](https://www.npmjs.com/package/axios) is a library and we need to add it using npm or yarn. The JSON file will look like this:

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:2500/https://www.filepicker.io/api/file/iIkTzKfCSyqC4wrNR6GG)

## Execution
```
$ yarn add axios 
$ mkdir public/data 
$ touch public/data/projects.json 
// add the json code to public/data/projects.json 
```
Now, we need to modify our `Projects` component again.

The first thing we need to do is to make the `axios` library available to us:

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:2500/https://www.filepicker.io/api/file/GD2v8dehRZwFcIifvZ8U)

Next, remove the projects data from the `constructor()` (we will use `this.setState()` function in just a moment to populate it.)

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:2500/https://www.filepicker.io/api/file/F4F5FaEmRrShyA9BuGkq)

Now it’s time to get one of those lifecycle events to work for us. We will tap into the `componentDidMount()` event and use `axios` to read our JSON file and set the state of the component with project data.

Add the following function to the component:

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:2500/https://www.filepicker.io/api/file/lN0kSkccSkeP4Kdp3lUh)

That should do it. We do not have to make any changes to the `render()` function. Now restart your development server and you should be able to see the projects list if you click on the `My Projects` tab.

## Wrap up

If you run the cypress test now, you will see that it does not go green. Hopefully, you noticed when you added the code to the `Projects` component that what we added would not make the test go green. There’s a lot more information about our projects that we would like to display on our page and further refactorings we can make to the code to have it more readable and also to make the tests go green. But we’ll deal with that in the next section of the course.