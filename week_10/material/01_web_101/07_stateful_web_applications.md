## State - Can we fake it?

We know that the HTTP protocol is **stateless**. In other words, the server does not hang on to information between each request/response cycle.

Each request made to a resource is treated as a brand new entity, and different requests are not aware of each other. This statelessness is what makes HTTP and the internet so distributed and difficult to control, but it's also the same ephemeral attribute that makes it difficult for web developers to build stateful web applications.

As we look around the internet and use familiar applications, it feels like that applications actually somehow has a certain state. For example, when we log in to Facebook or Twitter, we can see our username at the top, signifying our authenticated status. 

If we click around (which generates new requests to Facebook's servers) we are not suddenly logged out; the server response contains HTML that still shows our username, and the application seems to maintain its state.

Moving forward, we'll focus on how this happens by discussing some of the techniques being employed by web developers to simulate a stateful experience. Along the way, we'll also discuss some techniques used on the client to make displaying dynamic content easy.

The approaches we'll discuss are:

- Sessions

- Cookies

- Asynchronous JavaScript calls, or AJAX

## Sessions

It's obvious the stateless HTTP protocol is somehow being augmented to maintain a sense of statefulness. With some help from the client (i.e., the browser), **HTTP can be made to act as if it were maintaining a stateful connection with the server**, even though it's not. One way to accomplish this is by having the server send some form of a unique token to the client. Whenever a client makes a request to that server, the client appends this token as part of the request, allowing the server to identify clients. In web development, we call this unique token that gets passed back and forth the session identifier.

This mechanism of passing a session id back and forth between the client and server creates a sense of persistent connection between requests. Web developers leverage this faux statefulness to build sophisticated applications. Each request, however, is technically stateless and unaware of the previous or the next one.

This sort of faux statefulness has several consequences. First, every request must be inspected to see if it contains a session identifier. Second, if this request does, in fact, contain a session id, the server must check to ensure that this session id is still valid. The server needs to maintain some rules with regards to how to handle session expiration and also decide how to store its session data. Third, the server needs to retrieve the session data based on the session id. And finally, the server needs to recreate the application state (e.g., the HTML for a web request) from the session data and send it back to the client as the response.

This means that the server has to work very hard to simulate a stateful experience, and every request still gets its own response, even if most of that response is identical to the previous response. For example, if you're logged into Facebook, the server has to generate the initial page you see, and the response is a pretty complex and expensive HTML that your browser displays. The Facebook server has to add up all the likes and comments for every photo and status, and present it in a timeline for you. It's a very expensive page to generate. Now if you click on the "like" link for a photo, Facebook has to regenerate that entire page. It has to increment the like count for that photo you liked, and then send that HTML back as a response, even though the vast majority of the page stayed the same.

Fortunately, Facebook uses Ajax instead of refreshing your browser. But if Facebook didn't use Ajax, each page refresh would take a really long time.

There are many advanced techniques that servers employ to optimize sessions and, as you can imagine, there are also many security concerns. Most of the advanced session optimization and security concerns are out of scope of this book, but we'll talk about one common way to store session information: in a browser cookie.

## Cookies

A cookie is a piece of data that's sent from the server and stored in the client during a request/response cycle. Cookies or HTTP cookies, are small files stored in the browser and contain the session information. By default, most browsers have cookies enabled. When you access any website for the first time, the server sends session information and sets it in your browser cookie on your local computer. Note that the actual session data is stored on the server. The client side cookie is compared with the server-side session data on each request to identify the current session. This way, when you visit the same website again, your session will be recognized because of the stored cookie with its associated information.