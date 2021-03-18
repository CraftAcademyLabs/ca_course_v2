```ruby
# spec/requests/api/api_responds_with_one_specific_articles_spec.rb

RSpec.describe 'GET /api/articles/:id' do
  describe 'successfully' do
    let!(:article) { create(:article, title: 'This is the latest news', body: 'And this is some mind blowing content') }

    before do
      get "/api/articles/#{article.id}" #explain this with random id's and get back to that when tests are going green
    end

    it 'is exptected to return a 200 status' do
      expect(response).to have_http_status 200
    end

    it 'is expected to return the requested articles title' do
      expect(JSON.parse(response.body)['article']['title']).to eq 'This is the latest news'
    end
  end
end
```
- stop here now and create the response json module and include it in the `rails_helper`

```ruby
module ResponseJSON
  def response_json
    JSON.parse(response.body)
  end
end
```
- Go back to the test and refactor and write a test for the content as well
```ruby
# spec/requests/api/api_responds_with_one_specific_articles_spec.rb

RSpec.describe 'GET /api/articles/:id' do
  describe 'successfully' do
    let!(:article) { create(:article, title: 'This is the latest news', body: 'And this is some mind blowing content') }

    before do
      get "/api/articles/#{article.id}" #explain this with random id's and get back to that when tests are going green
    end

    it 'is exptected to return a 200 status' do
      expect(response).to have_http_status 200
    end

    it 'is expected to return the requested articles title' do
      expect(response_json['article']['title']).to eq 'This is the latest news'
    end

    it 'is expected to return the requested articles body' do
      expect(response_json['article']['body']).to eq 'And this is some mind blowing content'
    end
  end
end
```

- And now we can see that we get undefined method for body, because we don't have that in our database. 
- show schema and talk about that file 

```
rails g migration AddBodyToArticle body:text
```
- strings in rails has a limitation, and therefor we can use text instead
- Why don't we just add it to the schema?
- why don't we just go into the previous migration and change that?

- run the migrations, and add the tests about the content to the model spec
- update the factory
- Show the other way of adding validations to the model

- Back to the request spec and now the route is missing, remove the `only` first to show how you can find out how the routes look

- add the show request and put a binding.pry in there
- show the params and talk about that we want to find this article in the db 

```ruby
  def show
    article = Article.find(params['id'])
    render json: {article: article}
  end
```

- run Rspec again 

- and Boom! Everything is green! 