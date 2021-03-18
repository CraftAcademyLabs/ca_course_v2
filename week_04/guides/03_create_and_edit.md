- branch off

```ruby
api_provides_user_to_create_an_article_spec.rb

RSpec.describe 'POST /api/articles' do
  describe 'successfully' do
    before do
      post '/api/articles',
      params: {
        article: {
          title: 'This is a new article',
          body: 'With some brand new content'
        }
      }
    end

    it 'is expected to return a 201 response status' do
      expect(response).to have_http_status 201
    end

    it 'is expected to return a success message' do
      expect(response_json['message']).to eq 'The article was successfully created'
    end
  end
end
```

- run rspec
- here we go again, go to routes and add new

```ruby
articles_controller

  def create
    binding.pry
  end
```
- Try to just pass in `article = Article.create(params['article'])` in pry to show the mass assignment error
```
  def create
    Article.create(article_params)
    render json: { message: 'The article was successfully created' }, status: 201
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
```
- run rspec
- And we're green! That was fairly simple? 
- But what happens if the title is empty for example?

```
 if article.persisted?
    render json: { message: 'The article was successfully created' }, status: 201
  else
    #we need to do somethign here
    binding.pry
  end
```
- In binding.pry, look at the errors
`article.errors.full_messages.to_sentence`

**COMMIT!**
____

```ruby
api_provides_user_to_edit_an_article_spec.rb

RSpec.describe 'PUT /api/articles' do
  let(:article) { create(:article) }
  describe 'successfully' do
    before do
      put "/api/articles/#{article.id}",
          params: {
            article: {
              title: 'This is the new and cool title'
            }
          }
    end

    it 'is expected to return 201 status' do
      expect(response).to have_http_status 201
    end

    it 'is expected to return success message' do
      expect(response_json['message']).to eq 'The article was successfully updated'
    end

    it 'is expected to update the article' do
      expect(article.title).to eq 'This is the new and cool title'
    end
  end
end
```
- ad update to the routes, why should we keep the only?
- put a binding.pry in the update action and take it one step at the time

```ruby
  def update
    article = Article.find(params['id'])
    article.update(article_params)
    if article.save
      render json: { message: 'The article was successfully updated' }, status: 201
    else
      render json: { message: article.errors.full_messages.to_sentence }, status: 422
    end
  end
```
- Change the last test accordingly: 
```ruby
    it 'is expected to update the article' do
      expect(article.reload.title).to eq 'This is the new and cool title'
    end
```


**Some refactoring if time**

```ruby
 class Api::ArticlesController < ApplicationController
  def index
    articles = Article.all
    render json: { articles: articles }
  end

  def show
    article = Article.find(params['id'])
    render json: { article: article }
  end

  def create
    article = Article.create(article_params)

    if article.persisted?
      success_message('created')
    else
      error_message(article)
    end
  end

  def update
    article = Article.find(params['id'])
    article.update(article_params)
    if article.save
      success_message('updated')
    else
      error_message(article)
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end

  def success_message(action)
    render json: { message: "The article was successfully #{action}" }, status: 201
  end

  def error_message(article)
    render json: { message: article.errors.full_messages.to_sentence }, status: 422
  end
end
```