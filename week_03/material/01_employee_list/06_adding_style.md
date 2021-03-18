## Using a style library
These days it's crucial not to neglect the UI, and while it can be good fun to build your own designs from scratch, this also proves to be extremely time consuming.  

Since time is the one thing we don't have in this boot camp, we choose to use pre-designed components. 
Throughout the boot camp, we will be using [Semantic UI,](https://react.semantic-ui.com/) but there's plenty of other cool libraries and frameworks out there. 

Well, let's get at it and install the dependencies:  
```$ yarn add semantic-ui-react semantic-ui-css```  

Once installed, we need to import the css into our entry point (```index.js```):  
```
import React from 'react';
import ReactDOM from 'react-dom';
import 'semantic-ui-css/semantic.min.css';  <---
import App from './App';
// rest of the code...
```

And now, we're ready to get stylin'!

## Working with Semantic UI



[Container](https://react.semantic-ui.com/elements/container/)  
[Header](https://react.semantic-ui.com/elements/header/)  
[Item](https://react.semantic-ui.com/views/item/)  