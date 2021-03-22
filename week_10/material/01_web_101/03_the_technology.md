
We just created our first little application using ExpressJS ([https://expressjs.com/](https://expressjs.com/)) - a NodeJS web application framework. It's not much, but we got to experience a bit of Internet magic ;-)

Our server got a request, and responded. That is exactly what it's all about.

## Request - Response

**Request – Response** is a **message exchange pattern** in which a requestor sends a request message to a replier system which receives and processes the request, ultimately returning a message in response.

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/gKrcd5GmRIiEGo39JIeA)

When you click a link on a web page, submit a form, or run a search, the browser sends an HTTP Request to the server.

### HTTP

In this section we will get an introduction to HTTP, the protocol underlying all of the web. This section will help you understand a bit more about the technologye behind web applications and how they work.

HTTP stands for Hypertext Transfer Protocol. It's a stateless, application-layer protocol for communicating between distributed systems, and is the foundation of the modern web. As a web developer, we all must have a strong understanding of this protocol. **HTTP allows for communication between a variety of hosts and clients, and supports a mixture of network configurations**.

#### Stateless

**HTTP is a stateless protocol**. To make this kind of communication possible, HTTP assumes very little about a particular system, and does not keep state between different message exchanges.

The client initiates an HTTP request message, which is serviced through a HTTP response message in return. We will look at this fundamental message-pair in the next section.

The current version of the protocol is HTTP/1.1, which adds a few extra features to the previous 1.0 version. The most important of these, in my opinion, includes persistent connections, chunked transfer-coding and fine-grained caching headers. We'll briefly touch upon these features in this article; in-depth coverage will be provided in part two.

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/m8kSeq2vQPO5wY4NODCe)

**To view the request or response HTTP headers in Google Chrome, take the following steps:**

-   In Chrome, visit a URL, _right click_, select `Inspect` in the pop-up to open the developer tools (or press Cmd Option J (on Mac) or Ctrl Shift J (on Windows) ).
-   Select the `Network` tab.
-   Reload the page, select any HTTP request on the left panel, and the HTTP headers will be displayed on the right panel.

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/udX3dRvRCmq7nqYeNoS4)

## HTTP Verbs

One of many parts ot HTTP that is really important to understand as developers is the HTTP Verbs.

URLs reveal the identity of the particular host with which we want to communicate, but the action that should be performed on the host is specified via HTTP verbs. Of course, there are several actions that a client would like the host to perform. HTTP has formalized on a few that capture the essentials that are universally applicable for all kinds of applications.

These request verbs are:

-   **GET**: fetch an existing resource. The URL contains all the necessary information the server needs to locate and return the resource.
-   POST: create a new resource. POST requests usually carry a payload that specifies the data for the new resource.
-   **PUT** or **PATCH**: update an existing resource. The payload may contain the updated data for the resource.
-   **DELETE**: delete an existing resource. The above four verbs are the most popular, and most tools and frameworks explicitly expose these request verbs. **PUT/PATCH** and **DELETE** are sometimes considered specialized versions of the **POST** verb, and they may be packaged as **POST** requests with the payload containing the exact action: create, update or delete.