source 'http://rubygems.org'

ruby '2.4.1'


gem 'rails', '~> 5.0.2'
gem 'pg'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem "slim-rails"

gem 'sidekiq'
gem "sidekiq-cron", "~> 0.4.0"
gem 'sinatra', require: nil #for sidekiq

gem 'rails_admin'

gem 'bootstrap-sass'
gem "font-awesome-rails"
gem 'simple_form'

# gem "lograge"

gem "rolify"
gem 'seedbank', '~> 0.4.0'

gem 'rest-client'

group :development do
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rails_layout'
  gem 'spring-commands-rspec'
end
group :development, :test do
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'rspec-rails'
  gem 'byebug', platform: :mri
  gem 'letter_opener'
end
group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'selenium-webdriver'
  gem 'poltergeist'
  gem 'phantomjs'
  gem 'rack_session_access'
  gem 'rack-test'
  gem 'rspec-sidekiq'
  gem 'pundit-matchers'
  gem 'shoulda', '~> 3.5'
end
group :production, :staging do
  gem 'rails_12factor'
end
