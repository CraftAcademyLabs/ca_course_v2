The YML file can be parsed as an object and stored in a variable. Let’s try that and call the variable `collection`.

Open `irb`.
```
$ irb
2.5.1 :001 > require 'yaml'
 => true 
2.5.1 :002 > collection = YAML.load_file('./lib/data.yml')
 => [{:item=>{:title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"Skratta lagom! Sa pappa Åberg", :author=>"Gunilla Bergström"}, :available=>false, :return_date=>"2016-05-25"}, {:item=>{:title=>"Osynligt med Alfons", :author=>"Gunilla Bergström"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"Pippi Långstrump", :author=>"Astrid Lindgren"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"Pippi Långstrump går ombord", :author=>"Astrid Lindgren"}, :available=>true, :return_date=>nil}]
```
Knowing this you can create a collection of books for your library.