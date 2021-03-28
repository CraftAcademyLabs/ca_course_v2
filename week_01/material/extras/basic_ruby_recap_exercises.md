## Let's freshen up on some Ruby!
It will benefit you a lot if you get a good grasp of the fundamentals early on, so that further down the line, you will be able to focus on problem solving, rather than syntax and basic functionality. 

So, without further ado, create a new `.rb` file for the exercises and let's start from the ground up. Remember, it's perfectly fine if you're not able to do all the exercises by heart. Being a good developer is all about being able to find a solution - and not necessarily about knowing everything up front.

### Round 1
#### **Data types**
In Ruby, we have 6 types of data. Let's make sure that we understand each of them and know how use them:  

**Define 6 variables and assign each of them a value of a different data type**
```
im_a_string = *some_value*
im_a_number = *some_value*

# .. etc
```
While you write them, reflect on their purpose and how they are used.
#### **Converting data types**
Often, we want our variables to interact with each other, but if they are of different data types, we will normally get a big error thrown in our faces. 

Fortunately, Ruby has built in `methods` that can help us here. [Go and research these methods](https://www.google.com/search?q=How+to+convert+ruby+types&sxsrf=ALeKk01TPUJJ5E4mbQm_hfkfKAH2-8kJ-w%3A1616677149953&ei=HYlcYPLQOaL4qwGizryYDg&oq=How+to+convert+ruby+types&gs_lcp=Cgdnd3Mtd2l6EAMyCAghEBYQHRAeMggIIRAWEB0QHjIICCEQFhAdEB46BwgjELADECc6BwgAEEcQsAM6CAgAELEDEIMBOgsIABCxAxDHARCjAjoFCAAQsQM6AggAOgIILjoECCMQJzoGCCMQJxATOgQIABBDOgUIABDLAToGCAAQFhAeOgQIABATOggIABAWEB4QE1Cx0CRYnPMkYOjzJGgGcAJ4AIABdogBhRSSAQQyMS43mAEAoAEBqgEHZ3dzLXdpesgBCcABAQ&sclient=gws-wiz&ved=0ahUKEwiy0_TZv8vvAhUi_CoKHSInD-MQ4dUDCA0&uact=5) if you don't already know them, and **solve the two errors below without modifying the actual values:**
```
one = "1"
two = 2

puts one+two
# should output: 3
```
```
winner = 'Jack'
prize = 10000

puts "Wow, " + winner + "! You just won " + prize + "kr!"
# should output: Wow, Jack! You just won 10000kr!
```
Nice one. These small converters may come in handy in the future!

#### **Accessing info inside arrays and hashes**
Something that you will be doing over and over again is storing information inside arrays and hashes. But what's even more important is to be able to access this information. Let's do some digging.

**Replace '?' with the correct element accessors to log the expected outputs:**
```
weather = ['rainy', 'sunny', 'windy', 'snowy']

puts ?
# should output: windy
```
```
nested = ['Apple', ['Banana', 'Pear'], ['Pineapple']]

puts ?
# should output: Banana
```
**Alright, good job. Let's do the same with hashes!**
```
contact = {
  name: 'Benny',
  age: '29',
  hobby: 'Planting fig trees'
}

puts ?
# should output: Planting fig trees
```
```
database = {
  books: [
    {
      title: 'Moby Dick',
      pages: 927
    },
    {
      title: 'Beginning Programming for Dummies',
      pages: 255
    }
  ]
}

puts ?
# should output: 927
```

Neat work! How about we turn it up a bit.

### Round 2
#### **Looping**
Let's get those repetitious tasks out of the way with some looping:   
**Create the following output using both a `while`, an `unless`, and a `for` loop:**
```
# should output: 0
# 1
# 2
# 3
# 4
# 5

```
#### **Conditionals**
Super! Now, let's add another layer of logic.

**Use an `if else` inside the loop to log the expected output:**

```
for i in 1..5
 # code goes here..
end

# should output: 
# I ain't divisible by 2 :(
# Yay, I'm divisible by 2!
# I ain't divisible by 2 :(
# Yay, I'm divisible by 2!
# I ain't divisible by 2 :(
```
#### **Methods**
It's time to build the logic into reusable chunks of code, namely with `methods`. Let's start simple:  

**Write a method that logs the expected output when called**
```
# .. Define your method here

greetings()
# should output: Hello world!
```
Right, that's cool, but we'd like a bit more in control of the output:

**Rewrite the method so it fulfills the expected output:**
```
def greetings
  puts 'Hello world!'
end

greetings('Mars')
# should output: Hello Mars!
greetings('Thomas')
# should output: Hello Thomas!
```
Nice! Working with `parameters` *(the name you put between the method’s parentheses when you define it)* and `arguments` *(the piece of code you actually put between the method’s parentheses when you call it)* is a cornerstone concept in the world of software development, and it's important to understand this relationship.

Let's finish round 2 with a more complex exercise that envelopes the different concepts from this round:

**Write functionality that will count all integers from 1 to `number` (being the argument) and calculate the sum of these. If the sum is below 10, it means failure. 10 or above means passing!**

```
def check_sum(number)

end

check_sum(3)
# should output: Total sum: 6. Unfortunately below 10, you fail!
check_sum(8)
# should output: Total sum: 36. You pass!
```
Try to dissect the problem into smaller bits of logic to maintain an overview. Bonus points for `string interpolation`!

Very nice! You deserve a break, perhaps some fresh air or a cup of coffee. 

Whenever you're ready, let's hit that round 3!

## Round 3
As you have probably understood by now, Ruby has a lot of built-in functionality. While it's not our job as developers to remember and master every method, it's important that we know **that they exist** and that we are able to **look up the functionality**. 

#### **Built-in methods**
Let's practice this workflow while we also get familiar with some of the most common methods:

**Find the amount of elements in the array:**
```
my_long_array = [1, 4, 3, 4, 5, 501, 23, 6, 62, 312, 123, 433, 66]

# should output: 13
```
**Add `a` to the end of `my_array`. Then remove the first element.**
```
my_array = ['mnday', 'monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday']
a = 'sunday'

# Add code here

puts my_array

# should output: 
# monday
# tuesday
# wednesday
# thursday
# friday
# saturday
# sunday
```
**Sort the array from lowest to highest. Then reverse the order:**
```
my_confused_array = [2, 5, 3, 1, 9, 3, 6, 2]

# Add code here

p my_confused_array

# should output: [9, 6, 5, 3, 3, 2, 2, 1]
```
**Iterate over the hash and log the expected output:**
```
mountain_heights = {
  'Mount Everest': 8848,
  'K2': 8611,
  'Kanchenjunga': 8586
}

# should output: 
# key = Mount Everest, value = 8848
# key = K2, value = 8611
# key = Kanchenjunga, value = 8586
```
**Iterate over the array and save numbers above 5 in a new array:**
```
my_array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
my_new_array = ?

# Add code here

p my_new_array

# should output: [6, 7, 8, 9, 10]
```
Well done! Knowing these methods makes life a bit easier.. Let's move on!

#### **Classes**
Ruby is an object oriented programming language, which means it's made up of objects and classes. A class is the blueprint from which individual objects are created. 

1. **As a soft start, define an empty `Class` called `Dumbbell`.**
2. **Add an `initialize` method that takes an argument of `weight` and sets an `instance variable`, called `weight`, equal to the argument.**
3. **Instantiate a new Dumbbell with a weight of 28 and save it to a variable called `my_dumbbell`**
4. **Add an accessor so that the following code outputs `28`**
```
my_dumbbell.weight
# should output: 28
```

#### **Final challenge**
Brilliant! You made it this far, which is awesome.

If you're up for it, let's do a final exercise. 

It will be up to you to figure out what kind of methods should be used and where. Again, try to separate the problem into different parts, and take one at a time.  
Remember there's multiple ways to solve the challenge, and none of them are necessarily more correct than the other. Godspeed! 

**Write a method that squares every digit of `number` and concatenate them:**
```
def squaring(number)
  # Your code goes here
end

squaring(4567)
# should output: 16253649
# because 4² is 16, 5² is 25, 6² is 36, and 7² is 49
```