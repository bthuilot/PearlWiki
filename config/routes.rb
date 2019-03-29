Rails.application.routes.draw do
  resource :users
  resource :categories
  resource :posts
  resource :static_pages

  # Static Pages
  root to: 'static_pages#home'
  get '/about' => 'static_pages#about'

  # Category controller
  get '/categories/new' => 'categories#new'
  get '/categories/:name' => 'categories#show'
  post '/categories/create' => 'categories#create'

  # Posts
  get '/page/:id' => 'posts#show'
  get '/page/new' => 'posts#new'
  post '/page/create' => 'posts#create'

end
