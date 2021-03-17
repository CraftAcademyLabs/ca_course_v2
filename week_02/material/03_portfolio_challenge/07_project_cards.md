
## More focus on projects - cards

We will spend some more time on our Project display and learn about `props`.

This is our end game for this section of the course:

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:2500/https://www.filepicker.io/api/file/UjTUh5MTSka5yx7vCfw6)

We need to add some more content to our `projects.json` and describe our projects in more detail.

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:2500/https://www.filepicker.io/api/file/pYlZG4zRR6aRTpzkk6KO)

If you examine the object carefully, you’ll notice that we’ve added keys for `image` and `description`. Feel free to add your own content if you like, or use the example above.

## Props

React components are reusable and can be used over and over again in the UI. Quite often we want to modify what data the component we use is going to display. We can pass in data to a component using `props`.

Props (short for properties) are equivalent to parameters in vanilla JavaScript and used to send data to components. The main difference between `state` and `props` is that props are immutable - they can not be changed.

We will make use of props in our projects list.

## Re-styling the projects list

In the previous part, we created a `Projects` component. I suggest that we modify the `render()` function with the following code where we delegate the rendering of each project to a new component (that we will create in just a minute) called `ProjectCard`. The reason for this is that I plan to add more information and styling to each project and want to keep the `Project` component clean. And, I want to showcase how we can use `props`- this is a course after all, and we came here to learn, right?

Modify the part of the code where we populate the `projectsList` variable with HTML.

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:2500/https://www.filepicker.io/api/file/06ggk2bsQxmQNL4ictcP)

And modify the JSX return:

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:2500/https://www.filepicker.io/api/file/uUDuHFS6RoGtCBOYhH6G)

We also need to create and `import` the `ProjectCard` component and the Grid component into `Projects`:

`$ touch src/ProjectCard.jsx`

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:2500/https://www.filepicker.io/api/file/fGUHQ84QuWV8rk7eREVH)

Please take a close look at `<ProjectCard project={project} />`. What we are doing is sending the current `project` object to our new `ProjectCard` component. It will be accessible as `this.props.project`.

Our new component can have a static type, so we do not have to use `class`. Create a new file in the `src` folder and call it `ProjectCard.jsx`. Add the following code to the new file:

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:2500/https://www.filepicker.io/api/file/nTx7u6fTtaX824LnhYkQ)

There are a few things to look out for.

Pay attention to the `props` parameter we are receiving. It’s the `project` object we sent off from the `Projects` component. We populate our HTML with data from that object (i.e. `project.name`, `project.description`, etc.)

## Wrap up

If you run the tests now, you will see that they are going green. We added the project image and description.

By adding a new component we can keep the code cleaner and more readable. It is also possible for us to reuse the component in other parts of the application. Can you think of any other use case for the `ProjectCard`? Does the naming hinder you from thinking of one?