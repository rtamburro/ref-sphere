Rails.application.routes.draw do
  resources :assignments
  resources :games
  devise_for :users, :controllers => {registrations: 'registrations'}
  
  resources :users, :only =>[:show]
  get 'users/index'
  match '/users', to: 'users#index', via: 'get'
  match '/users/:id', to: 'users#show', via: 'get'

  root "home#show"
end
