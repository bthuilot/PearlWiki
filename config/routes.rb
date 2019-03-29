Rails.application.routes.draw do
  resource :users
  resource :categories
  resource :static_pages

  # Static Pages
  root to: 'static_pages#home'
  get '/about' => 'static_pages#about'

  # Category controller
  get '/categories/new' => 'categories#new'
  get '/categories/:name' => 'categories#show'
  post '/categories/create' => 'categories#create'
end
