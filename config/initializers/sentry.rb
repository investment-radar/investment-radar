Raven.configure do |config|
  config.dsn = 'https://24f928b18494442eadb18c63e146a71a:4de04d1c793f4bf780d36becbba4ea46@sentry.io/275207'
  config.sanitize_fields = Rails.application.config.filter_parameters.map(&:to_s)
  # config.release = APP_VERSION
end
