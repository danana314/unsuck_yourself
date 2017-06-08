
Sidekiq.configure_server do |config|
	config.redis = { url: ENV['REDIS_URL'] } #variable set by hatch
end

#Loads the cron jobs specified in the schedule yml file (only if running from sidekiq server ie when run sidekiq command manually)
schedule_file = "config/schedule.yml"
if File.exists?(schedule_file) && Sidekiq.server?
  Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file)
end