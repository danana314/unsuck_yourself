Rails.application.routes.draw do

	require 'sidekiq/web'
	require 'sidekiq/cron/web'

	#authenticate :user, lambda { |u| u.admin? } do
		mount Sidekiq::Web => '/sidekiq'
	#end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

	scope module: :onboarding do
		root to: 'logins#new'
		resources :logins, only: [:new, :create]
		resources :sessions, only: [:new, :destroy]
		resources :registrations, only: [:new, :create]
		resources :tour, only: [:index]
	end

	resources :home, only: [:index]

	resources :users, only: [:edit, :update]

  namespace :workouts do
	  resources :complete, only: [:index]
  end
  resources :workouts, only: [:new, :show, :update]

  root 'logins#new'

end
