
At this point, we can go back to our acceptance test and run `rspec spec/requests/api/api_responds_with_a_collection_of_articles_spec.rb` again. We are still where we were before we went into our model, but now we can start adding some functionality to our index action.

Now, we need to modify the controller as well as the view to display (or try to display) our articles.

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/TMOp8UfpTT2atZZTiVW9)

If we run our tests now they are still not going green... We don't seem to get any articles.

The reason to that is because we don't have any articles stored in our database, but we do have the factory bot at our disposal.

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:1000/https://www.filepicker.io/api/file/MD9f6Yw0QdSYmrl9mok6)

At this point, if you run `rspec` you should see all tests passing green.