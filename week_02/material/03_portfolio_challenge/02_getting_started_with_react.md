
## Practicals

The only prerequisites for following along with this course is that you need to know relatively basic JavaScript (ES6), HTML and CSS and feel comfortable in your terminal as well as in the Developer Tools of your browser. We recommend that you use Chrome, as most of the screenshots we have included in these materials are from that browser.

The prime objective of this course is to get a basic understanding of the React library and secondly to finish the coding challenge and produce a personal portfolio application.

A word of caution, do not get too caught up in the styling of your portfolio. It’s a slippery slope and can lead to many hours of hunting for that pixel-perfect solution. I’m talking from my own experience. I’ve bitten off more than I could chew on many occasions in my career and if anything, working on CSS has cost me hundreds of hours of my life. I’m not saying that you should ignore the look and feel of your application. Not at all. What I’m saying is that it’s a matter of priorities - you are taking this course to learn the basics of React. Not to build a killer-app.

## Scaffold the application

Our first objective will be to create a new React application using the create-react-app script.

But of course, first, we need to install the package globally so that we can use it in any folder of our computer. To read more about create-react-app go to their [official website](https://create-react-app.dev/)

The people behind create-react-app (Facebook) recommend using npm for this, please run
```
npm install -g create-react-app
```
If the installation is successful `cd` to the appropriate folder (where you want to add your project)

I’m using yarn so the command is slightly different than the one you might be used to if you are an npm user. If you are using npm, then head over to the official documentation in order to see the right command.
```
$ yarn create react-app my_portfolio
```
Make sure to cd into your newly created application folder and open your application in your code editor. I’m using VSCode with CLI commands enabled, and I can open my project with a single terminal command:
```
$ cd my_portfolio

$ code .
```
I would also suggest that you fire up the development server and take a look at your app in the browser to see how a freshly made `create-react-app` looks. You can actually keep it running while you make changes to your code for the most part. The hot reloading allows you to do that and instantly see your changes come across in the browser. For the most part anyway (sometimes you DO have to restart your server, so please keep that in mind).

You start the server by typing the following in your terminal:
```
$ yarn start
```
### Cleaning up

I usually take a moment to clean up the scaffolded code. IMO, we should always keep our codebase clean and avoid having too many files if we don’t need them. I also get rid of some of the CSS and test files, as well as the SVG file with the spinning React logo. I suggest that you do the same. As a personal preference, I also change the suffix on the App component to `.jsx`.

Your folder and file structure should look something like this:
```
├── README.md
├── node_modules
├── package.json
├── .gitignore
├── public
│ ├── favicon.ico
│ ├── index.html
│ └── manifest.json
├── src
│ ├── App.jsx
│ ├── index.css    
│ ├── index.js    
│ └── reportWebVitals.js  
└── yarn.lock
```
You will note a few errors in your browser as you delete the files. That is, of course, caused by the imports in your index.js and App.jsx. Make sure that none of the deleted files are being imported in any of these two files. At this stage, I usually also clean up the returned `jsx` by the App component.

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:2500/https://www.filepicker.io/api/file/oV6W8qU2RjWEjSSLg1IA)

And

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:2500/https://www.filepicker.io/api/file/tU8aWGHTTbOhmnPXQayu)

At this stage, we have a “Hello World” application, up and running (again).

Restart your application from your command line (terminal)
```
$ yarn start
```
So far, so good. You should now see Hello World in your browser. If not read the error message carefully in the terminal to see why it’s not working.

**But other than that, congratulations you have created your first hello world application in React, easy huh?**