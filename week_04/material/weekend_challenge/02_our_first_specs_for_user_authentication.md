
To give you a bit of hand holding in the beginning of this challenge, we will provide you with some tests in the beginning so you can get a bit better understanding of `devise token auth` before it is time for you to take care of the **actual weekend challenge.**

Let’s start with writing some request specs for logging in.
```
$ touch spec/requests/sessions_spec.rb
```

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/P2S07V7pSum9AYq3fSfG)

If we run this spec now, we get an error regarding that the `factory bot` that we call upon doesn’t exist.

An easy fix to that is to run the `factory generator` in your terminal. (Yes, there IS a generator for factories!)
```
$ rails g factory_bot:model User email password password_confirmation
```

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/q9M5ECpjQ3uVYuocJqsG)

And now, all the tests are suddenly **going green**! `Devise token auth` gives us all the functionality we need to authenticate a user out of the box by just installing it.

Now you need to really examine this test and make sure that you understand what is going on. Because if you understand the test, then you understand a lot of the functionality that we have been given.