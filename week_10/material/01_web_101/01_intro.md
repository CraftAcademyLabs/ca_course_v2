Web application development refers broadly to the tasks associated with developing applications based on web technologies and accessible over Internet. What we ofter refer to as The Internet, is a global computer network providing a variety of information and communication facilities, consisting of hundreds of interconnected networks using standardized communication protocols. Web applications are a type of client/server applications where the information is carried over the HTTP protocol over that set of distributed networks. 

Web applications are usually build around two parts that are connected to eachother; a user facing client and a data handling server part. These are commonly refered to as front- and back-end applications. 

This course aims to close the gap between front- and backend development and bring a deeper understanding of the complete request-response lifecycle. 

First of all, it is essential for the developer to understand the REST philosophy, which was originally conceived as a system of request management for interaction between the server and the client: Get, Post, Put, Delete with a data relevance handler.

## Getting started

Your browser is the interface or window, through which you interact with the world wide web.

When you type a URL into the address bar of your web browser and hit `ENTER`, you expect to see the website displayed in your browser. When you click on a link on a page, or when you fill in and submit form, your browser may display the next page, or display errors in your form so you can correct them and submit again. 

Under your browser's hood lies a collection of files -- CSS, HTML, Javascript, videos, images, etc. -- that makes displaying the page possible. All these files were sent from a **server** to your browser, **the client**, using an **application protocol called HTTP** (the reason why the URL in your browser address bar start with "http://" or "http://").

**HTTP** is a set of rules (**a protocol**) that serve as a bridge between applications and the transfer of documents and other media. HTTP is built upon a simple model where a **client** makes a **request** to a **server** and awaits a response. Therfore, it's referred to as a **request response protocol**. More on that in a while.

**The Internet** consists of millions of interconnected networks that allow computers and devices to communicate with each other. The **Internet Protocol** (IP) is the fundamental protocol defining the Internet. IP has the task of delivering packets from a source host to the destination host. For this purpose, IP defines packet structures that encapsulate the data to be delivered. It also defines addressing methods that are used to label the datagram with source and destination information.

By convention, all devices that participate in a network are provided unique address, referred to as **Internet Protocol Address** (IP Address or IP Number). An IP Address acts as the identifier for a device or server, and can contain hundreds or thousands of ports, each used for a different communication purpose to that device or server, but we'll get to that later. 

Internet Protocol version 4 (IPv4) defines an IP Addresses as 32-bit numbers.

A port number is added at the end of the address:
```
174.16.254.1:80
```
**Port number `80` is often (but not always) used for HTTP requests.** 

So, every device has a public IP Address (provided by an Internet Service Provider). But what about an address like `www.theguardian.com`, or any other url that you type in to the address bar of your browser?  When we wish to connect to The Guardian's news site, we do not type in the IP Address, we type in its URL.

What we commonly refer to as URL is an acronym for Uniform Resource Locator, and is also interchangeably called a URI - A Uniform Resource Identifier.

Let's take a closer look at a URL that will be used when you want to access an article about Boris Johnson and Jeremy Corbyn and the UK election.
```
https://www.theguardian.com/politics/live/2019/nov/19/general-election-2019-nhs-labour-conservatives-tories-corbyn-johnson-swinson-sturgeon-tv-debate-brexit?page=with:block-5dd454cc8f087b800b61d42a#block-5dd454cc8f087b800b61d42a
```
We can break this URL into 5 parts:

- `http://` or `http://:` **The protocol scheme**. It always comes before the colon and two forward slashes and tells the web client how to access the resource. In this case it tells the web client to use the Hypertext Transfer Protocol or HTTP to make a request. (Other URL schemes are, `mailto`, `git` or `ws` (Web Sockets).

- `www.theguardian.com`: **The host identifier**. It tells the client where the resource is hosted or located.

- `:88` : **The port number**. It is only required if you want to use a port other than the default (not present in the example above).

- `/politics/live/2019/nov/19/general-election-2019-nhs...`: **The path**. It shows what local resource is being requested. This part of the URL is optional.

- `?page=with:block-5dd4...`: **The query string**, which is made up of query parameters. It is used to send data to the server. This part of the URL is also optional.

As mentioned above, we may want to include a port number which the host uses to listen to HTTP requests. A URL in the form of: `http://localhost:3000` is using the `port number 3000` to listen to **HTTP requests**. This is often used when we run a web server on our own computers during development. We'll get to that in a later section.  

The default port number for HTTP is `port 80`. Even though this port number is not always specified, it's assumed to be part of every URL. Unless a different port number is specified, `port 80` will be used by default in normal HTTP requests. To use anything other than the default, one has to specify it in the URL.

## Query Strings

Query strings are great to pass in additional information to the server, however, there are some limits to the use of query strings:

Query strings have a maximum length. If you have a lot of data to pass on, you will not be able to do so with query strings. Although officially there is no limit specified, recommendations state that uery strings accepeted by a server should be set to a maximum character limit of 1024. While the entire URL, including the query string, should be set to a max of 2048 characters

The name/value pairs used in query strings are visible in the URL. For this reason, passing sensitive information like username or password to the server in this manner is not recommended.

Also, space and special characters like & cannot be used with query strings. They must be URL encoded, which we'll talk about later.

- `?` - is a reserved character that marks the start of the query string

- `page=some_value` -  is a query parameter **name/value pair**

- `&` -  is a reserved character, used when adding more parameters to the query string