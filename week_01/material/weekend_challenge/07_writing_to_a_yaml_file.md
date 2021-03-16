If we introduce any changes to the object (in our `collection` variable), we would like to make then persistent. We need to update (write) to the same file where we got the data from. For example, if we do this in `irb`

To start with, we can modify the first object in the collection by setting `:available` to `false`
```
2.5.1 :019 > collection[0][:available] = false
 => false
 # And now, we open the YML file and store the entire `collection` again. 
2.5.1 :020 > File.open('./lib/data.yml', 'w') { |f| f.write collection.to_yaml }
 => 567
```

Knowing this, you will be able to build a method to update the collection of books in the library after that a check-out has been performed and your collection has a new state.