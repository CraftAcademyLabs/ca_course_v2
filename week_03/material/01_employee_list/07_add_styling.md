## Using a style library
These days it's crucial not to neglect the UI, however, while it can be good fun to build your own designs from scratch, this also proves to be extremely time consuming.  

Since time is the one thing we don't have in this boot camp, we choose to use pre-designed components. 
Throughout the boot camp, we will be using [Semantic UI,](https://react.semantic-ui.com/) but there's plenty of other cool libraries and frameworks out there. 

Well, let's get at it and install the dependencies:  

```
$ yarn add semantic-ui-react semantic-ui-css
```  

Once installed, we need to import the css into our entry point (`index.js`):  
```javascript
import React from 'react';
import ReactDOM from 'react-dom';
import 'semantic-ui-css/semantic.min.css';  <---
import App from './App';
// rest of the code...
```

And now, we're ready to get stylin'!

## Working with Semantic UI
Let's start with something simple, like a [Container](https://react.semantic-ui.com/elements/container/)   and a [Header](https://react.semantic-ui.com/elements/header/)  .  

In our `App.jsx`, we `import { Container, Header } from 'semantic-ui-react'` and swap these components with our `div` and `h1`, like so:

**image: adding_style_01**

The `Container` will add some margin to the layout, and the `Header`, well, is appropriate for headers...  

You may have noticed that we have given the `Header` a `size="huge"` property. This is a [shorthand prop](https://react.semantic-ui.com/shorthand-props) that comes with Semantic UI, and is a way for us to quickly and easily modify the design and functionality of Semantic's components. You will get used to these as you go on.  

From hereon out it's all about experimenting. Design and CSS can be a tricky size in the beginning, but it all comes down to repetition and experimentation.

## The Item component
If you need a little inspiration, we have added a solution below, using Semantic's [Item](https://react.semantic-ui.com/views/item/) component:

**image: adding_style_02**

Now, when we are done styling, we always run our test suite again, as it often happens that we accidentally meddle with functionality or reference attributes during styling. 

Perhaps we have even added additional functionality, as in our case above that now also features an image. We should add this to our test:

**image: adding_style_03**

So, with all 4 tests going green, pad yourself on the back! You have successfully received data from an API, stored it in your component, and then used it to display information in a dynamic manner. Brilliant! 

**Now it's time to crank up the complexity!**