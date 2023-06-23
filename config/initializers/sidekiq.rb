Sidekiq.configure_server do |config|
  config.redis = { url: ENV['redis_url'] }
  schedule_file = ENV['schedule_file']
  if File.exist?(schedule_file)
    Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file)
  end
end
