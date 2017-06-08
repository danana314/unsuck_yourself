require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module UnsuckYourself
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.autoload_paths += %W(#{config.root}/lib)
    config.assets.paths << Rails.root.join('vendor', 'assets', 'bower_components')

    Dir.glob("#{config.root}/app/services/**/").each do |path|
      config.autoload_paths += %W(#{path})
    end

    Dir.glob("#{config.root}/app/problem_engines/**/").each do |path|
      config.autoload_paths += %W(#{path})
    end

    Dir.glob("#{config.root}/app/jobs/**/").each do |path|
      config.autoload_paths += %W(#{path})
    end

    config.sass.preferred_syntax = :sass

    # We want to integrated sidekiq with active job (part of rails 4.0)
    config.active_job.queue_adapter = :sidekiq

  end
end
