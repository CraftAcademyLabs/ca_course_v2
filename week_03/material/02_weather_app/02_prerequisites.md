Let's take a closer look at some of the tools and concepts required for this mission. We'll need a Doppler radar, a few satellites, and some supercomputers to ...

Oh, wait a minute, we were to build the UI software, weren't we..?

Right, cool.. Let's dive in!

## Weather & Location APIs
It's our intention to build a web app that displays the user's weather conditions as well as their location. Since we're actually not meteorologists (I was just pretending **:(** ), we'll have to leverage on data that other people have acquired. 

### Open Weather Map
A great source for weather data is the Open Weather API, so go and explore their website a bit. In this challenge, we will be using their [one-call-api](https://openweathermap.org/api/one-call-api).  

Take a closer look at the API call structure. One of the `params` require an `appid`, which you can get by creating an account - so go ahead and do that. 

### Open Cage Data
Ideally, the Open Weather API would also provide us with some sort of location data, but, alas, it doesn't. 

So for the location, we'll be using the [Open Cage API](https://opencagedata.com/api). This, too, requires a personal key, so make an account here as well. 

Now, looking at both the API calls, you should notice that `lat` and `long` are also required `query params`. But since these will depend on the user, how do we access these values dynamically?

## The Navigator object.
It's time to experiment a little. You have previously worked with the `document` object, which is a property of the `window` object - that in turn represents an open browser window.  

Now, this `window` object has a lot of interesting properties and methods, but we're looking specifically for the one called `navigator`.

Navigator contains another property, `geolocation`, that features a method by which we can ask for the user's (or really the browser's) current position. The method is called `getCurrentPosition` and takes a callback function as an argument. 

Enough talk - let's go and... find ourselves?

**Open up your browser and go to the Console in your dev tools**

Let's call this `getCurrentPosition` with a `console.table` as the callback.

**image: prerequisites_01**

If you have given your browser access to your location, you should get a similar table containing your latitude and longitude.

Let's play around with this a bit more and attempt to extract the data even further:

**image: prerequisites_02**

## Postman
Cool, so now we are familiar with the two APIs, have our own API keys, and we also got our `lat` and `long`. 
This means that we can actually test run the APIs in order to inspect the responses. 

For this purpose, we use a software called Postman. It's a handy tool for carrying out API calls, and, if you download the desktop application, you can also use it to send requests to your `localhost` (which will come in handy once you get around to creating your own API!). 

So go ahead and download that and try to use what you've learned so far to receive some sweet data. Could look something like this:

*An API call to Open Cage:*  
**image: prerequisites_03**

*An API call to Open Weather:*   
**image: prerequisites_04**

In Postman you can save both the requests and the responses for later use. For your convenience, go ahead and save your responses because - **spoiler alert** - we'll use those in the next chapters to create something called a `fixture`!