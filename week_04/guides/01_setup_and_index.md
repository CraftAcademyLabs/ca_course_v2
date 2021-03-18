- gem install rails, but i dont need to do that

```
rails new rails_demo_cohort --api --database=postgresql --skip-test 
```
 - we need to pass in the api flag since rails can be used a fullstack application as well
 - cd into the application and open up in VS
 - aut : acceptance unit test
 
 ```
rails db:create db:migrate
```
 
 **MAKE A COMMIT**

 - Open up the server to show the 'yay'!

 - go to gemfile and clean up - change byebug to pry-rails

 ```ruby
group :development, :test do
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'factory_bot_rails'
  gem 'pry-rails'
end
 ```
- shoulda makes our unit tests shorter and easier

 - run bundle 

```
rails g 
```
- will show all the generators that we have available 
```
rails g rspec:install
```

```
.rspec 

--format documentation
--color
--require rails_helper
```

```ruby
# rails_helper

Dir[Rails.root.join('spec/support/**/*.rb')].sort.each { |f| require f }

RSpec.configure do |config|
	config.fixture_path = "#{::Rails.root}/spec/fixtures"
	config.use_transactional_fixtures = true
	config.infer_spec_type_from_file_location!
	config.filter_rails_from_backtrace!
	config.include FactoryBot::Syntax::Methods
  config.include Shoulda::Matchers::ActiveRecord, type: :model
end
```

```ruby
# spec/support/shoulda_matchers.rb

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
```
- run rspec 

**COMMIT**

```ruby
config/application.rb 

config.generators do |generate|
		generate.helper false
		generate.assets false
    generate.skip_routes true
		generate.view_specs false
		generate.helper_specs false
		generate.routing_specs false
		generate.controller_specs false
    generate.request_specs false
	end
```
- checkout a new branch

- create feature folder and specfile 

```ruby
# spec/requests/api/api_responds_with_collection_of_articles_spec.rb

RSpec.describe 'GET /api/articles' do
  describe 'successfully' do
    before do
      get '/api/articles'
    end

    it 'is expected to return a 200 response status' do
      expect(response).to have_http_status 200
    end

    it 'is expected to return all articles' do
      expect(JSON.parse(response.body)['articles'].count).to eq 3
    end

    it 'is expected to return articles titles' do
      expect(JSON.parse(response.body)['articles'].first['title']).to eq 'This is an awesome title'
    end
  end
end
```
- we should get an error that we have no route that matches index

```ruby
routes.rb

Rails.application.routes.draw do
  namespace :api do
    resources :articles
  end
end
```
- That opens up all the routes to the articles endpoint, but we should only have the routes open that we can take care of
```ruby
Rails.application.routes.draw do
  namespace :api do
    resources :articles, only: [:index]
  end
end
```
- show rails routes again

- run Rspec
- add the api folder to our controllers folder. 
- now we need a controller, and that we can generate
```
rails g controller api::articles index
```
- controllers are ALWAYS plural and models are ALWAYS singular, rails is sensitive for naming convention 
- the :: we need to pass to make the controller end up in the correct namespace 

- Run rspec again, ask if anyone knows what a 204 indicates?
- Put a binding.pry in the index method and only run the first test

**COMMIT!**
_____

- We need a model to be able to save articles to our database and then fetch them from there. 
```
rails g model article title:string 
```

- We get a lot of things here. Go over everything that we get. 

```
rails db:migrate
```

```ruby
# spec/models/article_spec.rb
RSpec.describe Article, type: :model do
  describe 'DB table' do
    it { is_expected.to have_db_column :title }
  end
  
  describe 'Validations' do
    it { is_expected.to validate_presence_of :title }
  end
  
  describe 'Factory' do
    it 'should have valid Factory' do
      expect(create(:article)).to be_valid
    end
  end
end
```
- Add the validation to the model

- Now back to requests specs, and we can now see that we can ask the model for all articles but it is empty. 
- Lets make use of the factory bot! 

```ruby
# spec/requests/api/api_responds_with_collection_of_articles_spec.rb

RSpec.describe 'GET /api/articles' do
  describe 'successfully' do
  let!(:articles) { 3.times { create(:article) } }
    before do
      get '/api/articles'
    end

    it 'is expected to return a 200 response status' do
      expect(response).to have_http_status 200
    end

    it 'is expected to return all articles' do
      expect(JSON.parse(response.body)['articles'].count).to eq 3
    end

    it 'is expected to return articles titles' do
      expect(JSON.parse(response.body)['articles'].first['title']).to eq 'This is an awesome title'
  end
end
```

- Go to the controller and update the index action:
```ruby
  def index
    articles = Article.all
    render json: articles
  end
```
- if we run the test again we can see that we get a 200 but the other tests are not passing. Let's put a binding.pry
- Put it in the test and have a look at the response.body

- Modify the index action:
```ruby
  def index
    articles = Article.all
    render json: {articles: articles}
  end
```
- Use postman to make a request, no articles??
- Go into rails console and create some, make the request again. 

**COMMIT**