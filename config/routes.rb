Rails.application.routes.draw do
  resource :users
  resource :categories
  resource :static_pages

  root to: 'static_pages#home'

  get '/categories/new' => 'categories#new'
end
