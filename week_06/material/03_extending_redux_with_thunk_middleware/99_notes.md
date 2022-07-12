
```
$ yarn add redux-thunk
```

```js
import { createStore, applyMiddleware } from "redux";
import thunk from "redux-thunk";
import rootReducer from "../reducers/rootReducer";
import initialState from "./initialState";

const configureStore = () => {
  return createStore(rootReducer, initialState, applyMiddleware(thunk));
};

export default configureStore;
```


```js
// state/actions/actions.js

import axios from "axios";

const setMessage = (message) => {
  return {
    type: "MESSAGE",
    payload: message
  };
};

export const Users = {
  index() {
    return async (dispatch) => {
      dispatch(setMessage('Loading...'));
      const response = await axios.get("https://reqres.in/api/users");
      setTimeout(() => {
        dispatch({
          type: "SET_USERS",
          payload: response.data.data
        });
        dispatch(setMessage('Done loading...'));
      }, 5000);
    }
  }
}
```

```js
// App.jsx
import React from "react";
import ChangeGreeting from "./components/ChangeGreeting";
import DisplayGreeting from './components/DisplayGreeting'

const App = () => {
  return (
    <>
      <DisplayGreeting />
      <ChangeGreeting />
    </>
  );
};

export default App;

```


```js
// components/ChangeGreeting.jsx
import React, { useState } from "react";
import { useDispatch } from "react-redux";
import { Users } from "../state/actions/actions";

const ChangeGreeting = () => {
  const [newGreeting, setNewGreeting] = useState();
  const dispatch = useDispatch();
  return (
    <>
      <input
        type="text"
        onChange={(event) => setNewGreeting(event.target.value)}
      />
      <button
        onClick={() =>
          dispatch({
            type: "CHANGE_GREETING",
            payload: newGreeting,
          })
        }
      >
        Click me
      </button>
      <button onClick={()=> dispatch(Users.index())}>Show users</button>
    </>
  );
};

export default ChangeGreeting;
```


```js
// components/DisplayGreeting.jsx
import React from "react";
import { useSelector } from "react-redux";

const DisplayGreeting = () => {
  const { greeting, message } = useSelector((state) => state);
  return (
    <>
      <div>{greeting}</div>
      <div>{message}</div>
    </>
  );
};

export default DisplayGreeting;

```
