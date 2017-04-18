Rails.application.routes.draw do

	resources :logins, only: [:create]
  resources :sessions, only: [:create, :destroy]
  resources :users

  root 'users#index'
end
