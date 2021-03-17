
## Deployment with Netlify

It’s time to move your app from the safety of your `localhost` to a server that is actually connected to the internet, and make it accessible to the general public. Don’t worry if your portfolio is not fully what you hope it to be, the fact that you publish it on the internet does not mean that it will be hit by a massive wave of visitors. We want to do it for learning purposes.

Do you need a computer set up as a web server and connected to the internet to make our application public? No, you don’t. There are plenty of services we can use to deploy our application to the cloud, making use of so-called Virtual Servers. One of these services is Netlify.

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:2500/https://www.filepicker.io/api/file/Xs0c8O0Qlmf6u3Ip7Ckl)

[Netlify](https://www.netlify.com/) is a platform you can use to automatically build, deploy, serve, and manage your frontend sites and web apps. It also provides a variety of other features like form processing, serverless functions, and split testing.

We will make use of the more advanced functions on Netlify later in the Full Stack Web Developer Bootcamp, but for now, we will stick to the basic stuff.

If you don’t have an account on Netlify, now is a good time to create one. I would strongly recommend that you use GitHub authentication. That will save you some time that you otherwise have to spend on the configuration of your account.

Before going to the netlify site we need to add another config file to our project. Netlify cannot handle `react-router` out of the box. `react-router` handles routing on the client side (browser) so when you visit non-root page (e.g. [https://yoursite.netlify.com/about](https://yoursite.netlify.com/about)), Netlify (server-side) does not know how to handle the route. (As your routes are set up in the root level).

To fix that you have to add another command to your `build script` in your `package.json:`

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:2500/https://www.filepicker.io/api/file/e5UEj3qEQWqx11AUwC7K)

This will redirect netlify index.html when it hits a 404 but the url will stay the same, and our site will render the correct route.

## Deploy your app

Let’s get started with the deployment process. It’ pretty straight forward, and this guide will serve as an orientation if you get lost. Remember that things change, and the interface might look slightly different when you visit the service.

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:2500/https://www.filepicker.io/api/file/GEcID7DSZeee7sF9lh3Q)

The first thing we want to do when we start is to tell Netlify where our code is located and what git provider we are using.

In your case, if you follow the regular flow we employ at Craft Academy, it will be GitHub.

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:2500/https://www.filepicker.io/api/file/Aqz2F0seT8W5Uf3rCDvs)

The next step is to tell Netlify what repository and branch you want to deploy. Search for your project and provide the necessary information for Netlify to know what to do.

The folder you want to deploy is the root folder, so you can leave that field blank.

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:2500/https://www.filepicker.io/api/file/92G603RIQoKMM7jcwFxg)

We don't have to make any modifications to the build settings so you can just go ahead and build with the settings that is created for you!

Once you are through that step, your application will be built and deployed. You will end up on a settings page, where you can review and change some settings.

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:2500/https://www.filepicker.io/api/file/Fj4LfHZmTL2DV6ASkHqV)

## The URL

Netlify assigns an application name to your app, that is also part of the URL you use to access it. You can change that setting to the name of your choice. That might be a good idea if you want to share your portfolio with friends and family. Or with your fellow students and coaches.

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:2500/https://www.filepicker.io/api/file/l8vOef47TBmE5xUxjn9y)

## Wrap up

Click on the link on the Settings page, or head over to your browser and type in the URL to see a live version of your portfolio. Congratulations, you just deployed your first React app to the internet.