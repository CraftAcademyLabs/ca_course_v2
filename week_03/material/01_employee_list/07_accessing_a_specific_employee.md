In this chapter we will be adding the **View** button to the employee list that, when clicked, will open a Modal containing information about that specific employee to whom the button belongs.   

We are going to look into two main things: 
1. Creating a Modal (a sort of pop-up)
2. Requesting information about a specific employee

## A new feature
Looking back at our first user story, we realize now that it's actually done! Big yay. 

That means it's time for us to define another second user story:
```
As an employee manager
In order to be able to see specific details about each employee
I would like to click a button and have the information displayed.
```

Super! Let's hit the ground running with some Cypress testing 🤙

Create a new test file ```displayEmployeeModal.feature.js``` and start cranking:


**image: accessing_a_specific_employee_01**

In this test we have moved additional logic inside of the ```beforeEach``` block. Since we want to trigger the pop-up on all tests, we can run this logic before every test, cleaning our code from a few redundant lines. 

Other than that, it's the same drill.

## The modal
It's time to create our pop-up, and, as usual, we'd like to separate our functionality. Thus, let's create a new component ```EmployeeModal.jsx``` in our components folder.

A modal will need a state of ```open``` in order to toggle its visibility, but it will also need a state to store the employee data - so we shall create another class component. 

**image: accessing_a_specific_employee_02**

We are using Semantic's ```Modal``` here, which might look intimidating at first, but if you go through it line for line, it will make a lot more sense. 

Now, the visual layer of our modal is created, but we also need to actually render it. Since we want a button for each employee, we will import it to our ```EmployeeList``` component and add it inside of the ```.map()``` method, like so:  

**image: accessing_a_specific_employee_03**

You may have noticed that we're passing down an ```id``` prop that is equal to the individual employee's id. We will use this id to specify our next API request. 

So, with the first test in the green, let's get down with the second one!

## Accessing single employee data
Having taken a look at the [reqres](https://reqres.in/) documentation, we noticed that, in order to target a specific employee, we need a *unique identifier* at the end of the request path. But other than that, it will look very similar to our previous API request:

**image: accessing_a_specific_employee_04**

So, we start off by importing axios. Then, we need two things, just like earlier:
1. A function that sends off a request and handles the response
2. Something that will trigger this function

The difference is that this API call is only necessary when the modal is actually showing. So, we add the function to an ```onClick``` attribute to the modal's trigger button, meaning that the request will be sent immediately as the button is clicked. 

Over in our ```getEmployee()``` function there's also a slight alteration. We have string interpolated and added the ```id``` inherited through ```props``` to the request's path - as you may have guessed, this is our unique identifier; also known as a **route param**. 

So, the magic here is that, depending on which View button we click, it will look at its inherited id, inject this into the API request and receive data corresponding to that specific employee.  
Not bad, right?

Now, if you're a golden nugget, you might be thinking:  
*'Instead of just passing down the individual employee's id to the ```EmployeeModal```, couldn't we have just passed down the whole object and then have access to both name, email, and avatar inside the Modal component without having to make an additional request?'*

The answer is yes - good thinking by the way - but then we wouldn't have been able to practice the specifying API call! 🚀

**To finalize, let's run our entire test suite and bask in the green light (I want it)**

Now, off you go to to play! Here's a couple bonus challenges for you, if you feel confident: 

1. Right now, the main API response features employee 1-6. Rewrite the call so you will instead receive employee 7-12.
2. The reqres API is responding with 6 employees by default. Rewrite the call to receive a different amount - let's say 4?
3. Add ```update``` functionality to the Modal's ```edit``` button.
4. Add ```delete``` functionality to the Modal's ```delete``` button

As a head start for 3. and 4., you can add the following lines right below the ```Modal.Content``` closing tag, and you should see two buttons in your Modal:
```
<Modal.Actions>
  <Button color='black'>
      Edit
  </Button>
  <Button negative >
      Delete
  </Button>
</Modal.Actions>
```
Other than that, try to follow the same ideation as throughout the challenge: 
1. Functionality that sends a request
2. Use the response to render something to the DOM 
3. A trigger that will invoke this functionality