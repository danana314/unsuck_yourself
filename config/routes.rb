Rails.application.routes.draw do


	scope module: :onboarding do
		root to: 'logins#new'
		resources :logins, only: [:new, :create]
		resources :sessions, only: [:new, :destroy]
		resources :registrations, only: [:new, :create]
		resources :tour, only: [:index]
	end

	resources :home, only: [:index]

	resources :users, only: [:edit, :update]

  root 'logins#new'
end
