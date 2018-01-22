Raven.configure do |config|
  config.dsn = Rails.application.secrets.sentry_dsn if Rails.application.secrets.sentry_dsn
  config.sanitize_fields = Rails.application.config.filter_parameters.map(&:to_s)
  config.environments = ['staging', 'production']
end
