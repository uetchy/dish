Rails.application.routes.draw do
  devise_for :users

  resources :favorites, except: [:new]

  get '/about' => 'static_pages#about'
  get '/search' => 'maps#search'

  root 'maps#index'
end
