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
  get '/page/new' => 'posts#new'
  get '/page/:id' => 'posts#show'
  post '/page/create' => 'posts#create'
  delete '/page/:id' => 'posts#destroy'
  get '/page/:id/edit' => 'posts#edit'
  post '/page/:id' => 'posts#update'

  # error pages
  %w( 404 422 500 503 ).each do |code|
    get code, :to => "static_pages#not_found", :code => code
  end

end
