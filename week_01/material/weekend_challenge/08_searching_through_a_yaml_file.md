
## Searching through a Hash

Let’s say that you have the above `collection` of books or whatever. Now you want to search for a specific item. If we would like to search for “Pippi Långstrump”, we could do something like this.
```
2.5.1 :002 > collection.detect { |obj| obj[:item][:title] == "Pippi Långstrump"  }
 => {:item=>{:title=>"Pippi Långstrump", :author=>"Astrid Lindgren"}, :available=>true, :return_date=>nil}
```
So `collection` is of class: `Hash`. We are calling `#detect` on it. What does the `#detect` method do?

Note that this will return an exact match, so it requires that you know the exact value of the key you are searching for.

How about if you just know part of the title of the book you are searching for? In the method above we use the equal operator (`==`), but what if there is another way? Well, we can make use of `#include`?.

Try this out (Note that we are only passing in “Pippi”).
```
2.5.1 :004 > collection.detect { |obj| obj[:item][:title].include? "Pippi"  }
 => {:item=>{:title=>"Pippi Långstrump", :author=>"Astrid Lindgren"}, :available=>true, :return_date=>nil}
```
This searches through the collection and returns the first object it finds that matches the criteria - in this case, the part of the title. But wait, in the collection we have 2 books with the word “Pippi” in the title.

Perhaps it would be better if we returned both of them with our search method?

Try this and note that I’m using `#select` rather than `#detect` on my `collection`.
```
2.5.1 :005 > collection.select { |obj| obj[:item][:title].include? "Pippi"  }
 => [{:item=>{:title=>"Pippi Långstrump", :author=>"Astrid Lindgren"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"Pippi Långstrump går ombord", :author=>"Astrid Lindgren"}, :available=>true, :return_date=>nil}]
```
And now I get both objects back.

Knowing this you can build a `search` method that will allow users to find a book they want to check out.