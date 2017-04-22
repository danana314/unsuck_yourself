require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is not running in test! It is running in #{Rails.env}") if !Rails.env.test?

require 'spec_helper'
require 'rspec/rails'

# set sidekiq jobs to run IMMEDIATELY
require 'sidekiq/testing'
Sidekiq::Testing.inline!

ActiveRecord::Migration.maintain_test_schema!

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

RSpec.configure do |config|

  Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

  config.use_transactional_fixtures = false

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!
end
