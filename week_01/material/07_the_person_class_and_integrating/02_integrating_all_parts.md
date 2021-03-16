Alright, at this stage we can create an `Atm`, we can create a `Person` that has an `Account`. The `Person` can have `cash` in the pocket, or hold his money in his `Account`. All pretty straight forward.

Now, we want to create a method that allows a person to withdraw funds using a specific ATM, and when he does that 3 things should happen:

• The **balance of the account** should DECREASE

• The **funds in the ATM** should DECREASE

• The **cash in pocket** should INCREASE

Consider these specs.

_spec/person_spec.rb_

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/h5qXk5zvRO6AdRIflBTa)

**Note:** There are some new commands and techniques in the code above. Google them, talk to your peers and figure out WHY we are using them so you get at a good understanding of what we are doing. I will be going over some of them in my talks and break-out sessions, but it is up to you to find the best way of using them.

