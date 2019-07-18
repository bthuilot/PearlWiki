Rails.application.routes.draw do

  # Static Pages
  root to: 'static_pages#home'
  get '/home' => 'static_pages#home', as: 'home'
  get '/home/edit' => 'static_pages#edit_home', as: 'edit_home'
  post '/home/update' => 'static_pages#update_home', as: 'update_home'
  get '/about' => 'static_pages#about', as: 'about'
  get '/about/edit' => 'static_pages#edit_about', as: 'edit_about'
  post '/about/update' => 'static_pages#update_about', as: 'update_about'

  # Category controller
  get '/categories/new' => 'categories#new', as: 'new_categories'
  get '/categories/home/:id' => 'categories#show', as: 'categories'
  post '/categories/create' => 'categories#create'
  delete '/categories/edit/:id' => 'categories#destroy', as: 'destroy_categories'
  get '/categories/edit/:id' => 'categories#edit', as: 'edit_categories'
  post '/categories/edit/:id' => 'categories#update', as: 'update_categories'

  # Posts
  get '/page/new' => 'posts#new', as: 'new_post'
  get '/page/:id' => 'posts#show', as: 'post'
  post '/page/create' => 'posts#create', as: 'create_post'
  delete '/page/:id' => 'posts#destroy', as: 'destroy_post'
  get '/page/:id/edit' => 'posts#edit', as: 'edit_post'
  post '/page/:id' => 'posts#update', as: 'update_post'

  # Search
  get '/search' => 'search#search', as: 'search'

end
