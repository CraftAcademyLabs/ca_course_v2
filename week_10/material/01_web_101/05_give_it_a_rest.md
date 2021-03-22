**REST**, or **REpresentational State Transfer**, is an architectural style for providing standards between computer systems on the internet, making it easier for systems to communicate with each other. REST-compliant systems, often called **RESTful** systems, are characterized by how they are stateless and separate the concerns of client and server.

In **RESTful** systems, clients send requests to retrieve or modify resources, and servers send responses to these requests. Based on the **URL** and the **HTTP verb**, various kinds of operations can be performed.

More precisely, a request generally consists of:

-   an HTTP verb, which defines what kind of operation to perform
-   a header, which allows the client to pass along information about the request
-   a path to a resource (URL)
-   an optional message body containing data

### HTTP VERBS
There are 4 basic HTTP verbs being used in requests to interact with resources in a RESTful system:

-   **GET** — retrieve a specific resource or a collection of resources
-   **POST** — create a new resource
-   **PUT** — update a specific resource
-   **DELETE** — remove a specific resource

### Headers
In the header of the request, the client sends the type of content that it is able to receive from the server. This is called the Accept field, and it ensures that the server does not send data that cannot be understood or processed by the client. The options for types of content are MIME Types (or Multipurpose Internet Mail Extensions, which you can read more about in the MDN Web Docs.

MIME Types, used to specify the content types in the Accept field, consist of a type and a subtype. They are separated by a slash (/).

For example, a text file containing HTML would be specified with the type text/html. If this text file contained CSS instead, it would be specified as text/css. A generic text file would be denoted as text/plain. This default value, text/plain, is not a catch-all, however. If a client is expecting text/css and receives text/plain, it will not be able to recognize the content.

Other types and commonly used subtypes:

-   images — `image/png`, `image/jpeg`, `image/gif`
-   audio — `audio/wav`, `image/mpeg`
-   video — `video/mp4`, `video/ogg`
-   application — `application/json`, `application/pdf`, `application/xml` `application/octet-stream`

For example, a client accessing a resource with id 23 in an articles resource on a server might send a GET request like this:

GET /recipes/23 HTTP/1.1
Accept: text/html, application/xhtml

The Accept header field in this case is saying that the client will accept the content in `text/html` or `application/xhtml`.

### Paths - URL's
A request to a RESTful system must contain a path to a resource that the operation should be performed on. In RESTful APIs, paths should be designed to help the client know what is going on.

Conventionally, the first part of the path should be the plural form of the resource. This keeps nested paths simple to read and easy to understand.

A path like `foodnetwork.co/users/299/order/3` is clear (for a developer with knowledge of REST) in what it points to, even if you’ve never seen this specific path before. It is hierarchical and descriptive. **The path is pointing to an order with id 3 for the user (customer) with id 299**.

Paths need contain the information necessary to locate a resource with the degree of specificity needed. When referring to a list or collection of resources, it is unnecessary to add an id to a POST request to a `foodnetwork.co/users` path would not need an extra identifier, as the server will generate an id for the new object.

If we are trying to access a single resource, we would need to append an unique identifier - an `id` to the path. For example:

-   `GET foodnetwork.co/users/:id` — retrieves the item in the users resource with the id specified.
-   `DELETE foodnetwork.co/users/:id` — deletes the item in the customers resource with the id specified.

### Responses
When the server is sending data to the client, it must include a content-type in the header of the response. This content-type header field alerts the client to the type of data it is sending in the response body. These content types are MIME Types, just as they are in the accept field of the request header. The content-type that the server sends back in the response should be one of the options that the client specified in the accept field of the request.

For example, when a client is accessing a resource with id 23 in an articles resource with this GET Request:

GET /recipes/23 HTTP/1.1
Accept: text/html, application/xhtml

The server might send back the content with the response header:

HTTP/1.1 200 (OK)
Content-Type: text/html

This would signify that the content requested is being returning in the response body with a `content-type` of `text/html`, which the client said it would be able to accept.

### Response codes
We already looked into response codes in the contect of making requests and recieving responses using the HTTP protocol. The response codes come into play in RESTful systems as well.

For each HTTP verb, there are expected status codes a server should return upon success:

-   **GET** — return 200 (OK)
-   **POST** — return 201 (CREATED)
-   **PUT** — return 200 (OK)
-   **DELETE** — return 204 (NO CONTENT)

If any of the above requests fails, the server should return the most specific status code possible corresponding to the problem that was encountered.