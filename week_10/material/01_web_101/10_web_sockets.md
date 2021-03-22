
WebSockets represent an evolution in client/server web technology. They allow a long-held single TCP socket connection to be established between the client and server which allows for bi-directional, full duplex, messages to be instantly distributed with little overhead resulting in a very low latency connection. All of that **in a single TCP connection**. This means that a WebSocket is a way for two or more computers to communicate with each other at the same time over a single network connection.

Both the WebSocket API and the well as native WebSocket support in browsers such as Google Chrome, Firefox, to JavaScript bridge implementation for IE, there are now WebSocket library implementations in Objective-C,. NET, Ruby, Java, NodeJS, and many other languages.

### Implementing WebSockets

The WebSocket Protocol has two parts:
-   a **handshake** to establish the upgraded connection
-   then the actual data transfer.

The client has to create a WebSocket connection by performing what is called a handshake. The client sends a regular HTTP request to the server with a special Upgrade header included to request the server for a WebSocket connection. If the server supports WebSockets it responds with another Upgrade header. The initial HTTP connection is replaced by a WebSocket connection that uses the same TCP/IP connection and the party is ready to start.

Once the socket is created, we should listen to events on it. There are 4 events you should be looking out for:

-   `open` – connection established,
-   `message` – data received,
-   `error` – websocket error,
-   `close` – connection closed.