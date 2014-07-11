Rails.application.routes.draw do
  devise_for :users

  get '/about' => 'static_pages#about'
  get '/search' => 'maps#search'

  root 'maps#index'
end
