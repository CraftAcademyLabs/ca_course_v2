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
Let's get started with our first test.  
To begin with, create a new test file in the ```cypress/integration``` folder.   
We will use a slightly different naming standard than the one proposed in the examples (more on this topic later).  
```$ touch cypress/integration/displayEmployeeList.feature.js```  

**Start with a describe block:**
```
describe('Display list of employees', () => {
  // Our tests will go here
})
```
Now it's time to write our first assertion. Let's start with a simple one - can we visit the site and see a header that says *Employee List*?  

**image: building_a_list_01**  

Since we want to visit our site on all tests, we add this inside a ```beforeEach``` block. Everything that goes inside this block will then be run before each test.  

Then we create our ```it``` block and write our first assertion. We want to access the element that has an ```id``` called ```header```, and we want this element to contain the text: *Employee List*

All of this goes inside our initial ```describe``` block, nothing new here!

**So, let's fire up Cypress and watch our test go red!**  
```$ yarn cypress```  
*```Expected to find element: #header, but never found it.```*  

So, commit your progress and let's head into implementation!

## Making our first test go green  
You have probably started to get the gist of this - obviously Cypress couldn't find something that doesn't exist yet, so that's exactly what we will change.

Let's visit ```App.js``` and first of all change it into a class component. You will learn much more about functional vs class components down the line, but for let's just rewrite the component into something like this:  

**image: building_a_list_02**

And then we add our ```header``` element and assign it an ```id="header"```

**image: building_a_list_03**

Voilà, now the test should go green! 

## The employee list
Right, now we're getting warmed up, so let's pick up the pace and create the list.  

We want to display details for 6 employees. Why 6? Well, we have to decide on something, and we want to be in control of the test data and of what we are actually showing to the user.  

Let's start with a new ```it``` block:

**image: building_a_list_04**

So, what this test implies is that we expect a sort of container element with an ```id``` of ```employee-list```. We then look ```within``` this and look for elements with a ```class``` attribute of ```employee-item```. 

Knowing that we want the list to contain 6 items of employee details, we expect the ```cy.get('.employee-item')``` to return an array of these 6 elements.  
This allows us to use the ```have.length``` matcher to count the elements in the array and then expect it to equal 6. 

We would also like to test that the list items do in fact contain the correct information. Let's do a sample test:

**image: building_a_list_04_2**

Once again, we go within the ```employee-list``` element and look for an ```employee-item```. This time though, we target the ```first()``` item, look for an element with a class of ```name```, and expect this element to contain *'George Bluth'*. 

Why George? Well, George is awesome..  

Again, running Cypress, this will of course fail... Add, commit, and brace for implementation!

### Rendering a list in React
So, we want to display a collection of employees, which entails two things:
1. A list element
2. The data that is to be displayed in this list

Working on this is also a good opportunity to practice SoC (separation of concerns), which is a software design principle that states that each bit of functionality should live in its own file.

So, instead of writing the list inside of our ```App.js``` component, let's extract the functionality to a separate component.  
Create a new folder inside ```src``` and call it ```components```. Inside this folder, we create the new component ```EmployeeList.jsx```

Before we get cracking, let's import the component inside ```App.js``` and render it inside the ```return``` block

**imgage: building_a_list_04_3**

Inside of ```EmployeeList``` we create a class component and store the employee details in its state.
The agency has provided us with a sample list for test purposes:
```
employees: [
      { id: 1, first_name: "George", last_name: "Bluth", avatar: "https://reqres.in/img/faces/1-image.jpg" },
      { id: 2, first_name: "Janet", last_name: "Weaver", avatar: "https://reqres.in/img/faces/2-image.jpg" },
      { id: 3, first_name: "Emma", last_name: "Wong", avatar: "https://reqres.in/img/faces/3-image.jpg" },
      { id: 4, first_name: "Eve", last_name: "Holt", avatar: "https://reqres.in/img/faces/4-image.jpg" },
      { id: 5, first_name: "Charles", last_name: "Morris", avatar: "https://reqres.in/img/faces/5-image.jpg" },
      { id: 6, first_name: "Tracey", last_name: "Ramos", avatar: "https://reqres.in/img/faces/6-image.jpg" }
    ]
```

Let's store this in our component's state to look something like this:  

**image: building_a_list_05**

Now, to create the list, we could of course hard-code a list element for each employee, but this would be tedious work and we would also have to manually add new list elements in case new employees are added in the future. 

Instead we will use a simple, but powerful piece of functionality from JavaScript - the ```.map()``` method. 

If you're unfamiliar with this method, I encourage you to go and read up on it, as it will be used extensively in your coding future. Check the [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/map) for example.

We will use the method to loop through our array of employee details and create a list element with the details for each iterated employee.   
This way, it doesn't matter whether the employee detail array has 5 elements or 500, making our code dynamic!

All these ```<li>``` elements are then stored in a variable, ```employeeList```, which we can then render inside of a ```<ul></ul>``` container, like:

**image: building_a_list_06**

**Back to Cypress, and watch it go green!**

Now, in the real world, we would never keep hard-coded data in our component's state like we have done, so this is of course next on our to-do list!