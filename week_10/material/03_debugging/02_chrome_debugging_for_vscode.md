
Chrome Debugger allows for debugging client-side JavaScript code running inside Google Chrome directly from Visual Studio Code. The extension connects to Chrome (using the Chrome Debugger protocol), and map files loaded in the browser to the files open in Visual Studio Code.

You can either setup VSCode to connect to an already running Chrome instance or start a new one with remote debugging enabled. We will start with the latter.

### Setup and basic configuration

You install the extension as any other directly from the IDE.

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/5NJJoBHRRuCXBONLrLe7)

Initially, our debugger does not have a configuration file, so we must make sure to create one.

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/AAkmNgKORaaguMOeM1Ia)

We will add a very basic configuration to our debugger that will allow us to open up the index.html file in our browser.
```json
{
    "name": "Launch index.html",
    "type": "chrome",
    "request": "launch",
    "file": "${workspaceFolder}/index.html"
}
```
Set a breakpoint in your code. It will be marked by a red bullet. On the debugger view, we will select "Launch index.html" and start it (by clicking the green arrow icon).

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/Nrt3rmzeSWGMGzw9Xs8N)

When the session has started, and the code reaches your breakpoint, the execution will be halted.

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/aHNF729jTMuTWN6CMwbV)

  

> **Let's spend a few minutes and acquaint ourselves with this extension before we move on to more advanced topics and use cases.**