
Debugging a Node application is not as straight forward as you would like. Unlike running JavaScript in the browser, you can’t just set breakpoints everywhere, refresh the page or restart the compiler and slowly walk through the code examining objects, evaluating functions and finding the mutation or missing variable, etc.

It might be hard, but it's NOT impossible ("Impossible is nothing", as they say, right?). You just have to know how.

### `console.log()`

Not much to say about this one. In Node, the `console` module provides a simple debugging console, and is pretty much the same as the functions provided by web browsers, but here the output is sent to `stdout` or `stderr`. Use it to examine your objects and messages. It's simple and limited.

### Chrome Dev Tools

To start debugging, run your Node.js application with the `--inspect` flag.
```
$ node --inspect app.js
```
![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/qUJstLmZSYaGfvVIMxMD)

Here, I want you to ignore the call to open `chrome-devtools://...`, but rather open `about:inspect` in your Chrome browser, and click on "**Open dedicated DevTools for Node**", to start debugging your application.

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/CjhyzcYTSMaHlnYtLFSp)

Set a breakpoint on any appropriate LOC and run your code (in this case by requesting the root path of the application). The execution will stop and you can access your application from the console or examine it using the available inspectors.

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/iNZwzqDQw6o0wIqCjPSA)

The good thing with using Chrome as a debugging tool is that you can debug both your front-end and back-end JavaScript code with the same interface.

### Debugger in VSCode

VSCode makes debugging your applications really simple. It's a bit easier that debugging in Chrome DevTools and allows you to stay in your IDE while debugging. The support for running debugger in also a built-in feature, but has to be enabled.

Open up Preferences (cmg + opt + J on a Mac) and find the setting for **Node Auto Attach** and enable it.

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/Ob4vSY3OTkyDaf5t0EHK)

Next thing is to navigate to any file, and set a breakpoint on any appropoite LOC. Fire up your application from the built-in VSCode terminal with the `--inspect` flag.

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/gsZvJq79RFiMM4HmPDVv)
```
$ node --inspect app.js
```
The execution will stop when your application reaches the breakpoint and you will be able to access your application and examine it using the available inspectors.

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/9fE7kQ32SZSi74i2g3yc)