## Getting started
Alright, let's start out by writing our first User Story:
```
As an employee manager
In order to be able to work with employee management
I would like to access a list of employees.
```

Okay, now let's break this down into a check-list of things that need to happen:

1. The user access the application using her/his browser
2. The application fetches the list of employees from the company's internal systems (exposed to the application by a Rest API endpoint)
3. A view with the employee data is rendered and displayed in the user's browser.

We can start with that and write a second User Story once we've finished implementing this first one.

## First things first
Let's get started with our first test (because we absolutely love testing)