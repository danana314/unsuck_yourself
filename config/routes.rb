Rails.application.routes.draw do


	scope module: :onboarding do
		root to: 'logins#index'
		resources :logins, only: [:index, :create]
		resources :sessions, only: [:index, :destroy]
		resources :registrations, only: [:new, :create]
	end

	resources :users

  root 'logins#index'
end
