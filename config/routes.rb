Rails.application.routes.draw do


	scope module: :onboarding do
		root to: 'logins#new'
		resources :logins, only: [:new, :create]
		resources :sessions, only: [:new, :destroy]
		resources :registrations, only: [:new, :create]
	end

	resources :users

  root 'logins#new'
end
