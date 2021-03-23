
### Share a Terminal

There are many use cases for sharing a terminal when running a session. You might want to run your sets or compile and execute some code or what have you. Sharing a terminal is as easy as just opening it in VSCode. Just select the Terminal menu item and click "New Terminal"

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/JuUeKMgvS563LAlLxYZc)

That't the fastest way. Your collaborators will be able to see your terminal, but not interact with it. There is a way to allow the to do that, but please make sure that you only assign those rights to people you really trust. Okay?

Click on your username or open up the Command Palette and choose "Share Terminal". Once selected, you will be prompted with a choice to either give "Read/write" or "Read only" access. It's your decision.

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/AV01lu1PSmOKo3xGdvty)

Now, collaborators will not only be able to view but also edit the terminal and issue commands.


### Share a Server

"A picture is worth a thousand words", they say. Sometimes you want to show off your feature in action with whomever you are coding with. To illustrate a point or to show how a bug you are chasing manifests itself in your application or for any other of the thousand reasons spinning up a local server is needed. Unfortunately, it's often easier said than done (although ngrok is a fantastic tool for that).

Wouldn't it be great if you could start the server locally and allow your collaborators get access to the same running application?! Well, with Live Share you can. Let's get after it.

If you have a server software installed on your machine, use it to serve the folder you are currently in. If not, follow along the next step. I will install Superstatic - a lightweight web server that you can run on your localhost ([https://www.npmjs.com/package/superstatic](https://www.npmjs.com/package/superstatic)).

Install it globally using npm:
```
$ npm install -g superstatic
```
Once installed, you can spin it up from your project folder:
```
$ superstatic
```
  

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/DnKkP5EhThma55yiYvNK)

Open up the Command Palette or click on your user name to activate Live Share options (you know this by now, we've done it a few times already), and select "Share Server". You will be prompted to input the port where your server is running. In my case it's 3474. You can also give the server a name, but it's optional.

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/ENnsBSezSPiiTtvhDmxR)

Now, your collaborators can see the shared server in their Live Share settings in VSCode. Clicking this option will open up the application in the browser.

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/lMwyuvjsQau0Wau7Dxzi)

  

Note that the port we use in the browser is NOT the same as the one we shared (I'm simulating this on one single machine, using two different accounts, but it should be the same for you).

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/jYDgNQSOSsex4GYdBqUw)