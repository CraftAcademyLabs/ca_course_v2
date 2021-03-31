## Or so you thought..!
Right now, every time we run Cypress, we're actually sending off two real API requests. This isn't really a problem in itself, but imagine if you were paying for that API service, or if it was limited to 1 request per second, or something else super problematic.. 

Point being, it's worth your while to know how to block API calls in your test environment, create a `mock` of the response, and use that in your tests instead. Let's go!

## Creating a mock
There's two primary moving parts in this endeavour:
1. The `cy.intercept()`
2. A `fixture`

### cy.intercept()
[This badboy](https://docs.cypress.io/api/commands/intercept#Comparison-to-cy-route) allows us to stub, spy, or modify the behavior of HTTP requests. In our case, we want to use it to stub out the API calls.

```
// syntax example:

cy.intercept('URI', { fixture: 'example.json' })
```

Let's add this to our test before diving into fixtures:

**image: mocking_and_displaying_01**

As we only have 1 call to each of the URIs, we can set the `*` wildcards rather early on in the address. If we would've had multiple calls using the same API base, this would cause conflicts and we would have had to specify the URI more precisely in the intercept. 

Running the test, Cypress is definitely not happy with this:
```
> An error was thrown while processing a network event: A fixture file could not be found at any of the following paths:

> cypress/fixtures/weather_response.json 
> cypress/fixtures/weather_response.json{{extension}}
```
Obviously, because we haven't created the fixtures!

### Fixtures
A `fixture` is a file that contains a mocked response and lives in cypress/fixtures. A mocked response is basically an exemplification of a real API response, comprising the same structure. 

**Let's create our two fixtures!**

```
$ touch cypress/fixtures/weather_response.json
$ touch cypress/fixtures/location_response.json
```

As for the content; remember when I said it was a good idea to save your responses in Postman? Now is exactly when that comes in handy. Copy your saved responses into the respective fixtures. The beginnings should look something like this:

*location_response.json:*
```
{
  "documentation": "https://opencagedata.com/api",
  "licenses": [
      {
          "name": "see attribution guide",
          "url": "https://opencagedata.com/credits"
      }
  ],
  "rate": {
      "limit": 2500,
      "remaining": 2499,
      "reset": 1617062400
  },
  "results": [
      {
          "annotations": {
              "DMS": {
                  "lat": "55° 47' 2.90400'' N",
                  "lng": "12° 27' 6.24960'' E"
  // ...
```
*weather_response.json:*
```
{
  "lat": 55.7842,
  "lon": 12.4518,
  "timezone": "Europe/Copenhagen",
  "timezone_offset": 7200,
  "current": {
      "dt": 1617012886,
      "sunrise": 1616993313,
      "sunset": 1617039664,
      "temp": 9.04,
  // ...
```
Awesome! With Cypress satisfied, it's (finally) time to display something on the screen!

## Coming full circle
It's your turn to flaunter your inner designer and build an interface that displays the temperature and city. 

Just remember to assign the correct `data-cy` attributes to the right elements.  
Also, by now you may have noticed that I expected the temperature to equal **17**, but in my `fixture` the value is set to **9.04**. 

This raises a philosophical question - should I revise the test or change the `fixture`?  
I would personally argue that once we make an assertion in our test, we should do everything to see it through (unless there's a change in the logic, of course).

So I'll go ahead and change the `fixture`.

**That should pretty much do it!**

I trust that your app looks absolutely amazing and that Cypress has blessed you with green caresses.  
This weather app might not be a game-breaker, however the concepts that you have just pulled off lay the foundation of many apps out there:
1. Acquire information about the user.
2. Use this information dynamically to send API requests.
3. Display the personalized responses.

With that said and a few pats on your back, there's no rest for the weary! Let's keep the ball rolling with some extra challenges.