Rails.application.routes.draw do

	resources :logins, only: [:index, :create]
  resources :sessions, only: [:index, :destroy]
  resources :users

  root 'logins#index'
end
