require_relative 'helpers/sessions_helpers.rb'
RSpec.configure do |config|
	config.include Features::SessionHelpers, type: :feature
end

require 'features/features_spec_helper'
RSpec.configure do |c|
	c.include FeaturesSpecHelper
end