
Now it's time for us to test our model, to make sure it is doing what we expect it to do.

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/btAPuUY8R7yVJM6kErqL)

Everything in this test should go green expect from our Validations.
```
$ rspec spec/models/article_spec.rb 

Article
  DB table
    is expected to have db column named title

  Validations
    is expected to validate that :title cannot be empty/falsy (FAILED - 1)

  Factory
    should have valid Factory

Failures:
  1) Article Validations is expected to validate that :title cannot be empty/falsy
     Failure/Error: it { is_expected.to validate_presence_of :title }
       Expected Article to validate that :title cannot be empty/falsy, but this
       could not be proved.
         After setting :title to ‹""›, the matcher expected the Article to be
         invalid, but it was valid instead.
     # ./spec/models/article_spec.rb:8:in `block (3 levels) in <main>'

Finished in 0.07103 seconds (files took 1.23 seconds to load)

3 examples, 1 failure
```
To make that test go green as well, we need to add a validation to our model. Validations is a part of Active Record that helps us prevent malicious data from being saved and stored in our database but also makes sure that there are no empty rows in our database tables.

Open the model file and add validation for the presence of `title`.

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/wHxOV9LRTZObokZIMiBP)

Running the spec now you will see that we are moving in the right direction and all our model specs are now going green!

It's time to move back to our request spec and continue...