Rails.application.routes.draw do

	resources :logins, only: [:index, :create]
  resources :sessions, only: [:index, :destroy]
	resources :registrations, only: [:new, :create]

	resources :users

  root 'logins#index'
end
