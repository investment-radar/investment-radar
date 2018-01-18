Rails.application.configure do
  config.lograge.enabled = true

  config.lograge.custom_options = ->(event) do
    {
      time: event.time.iso8601,
      host: event.payload[:host],
      user_id: event.payload[:user_id]
    }
  end

  config.lograge.formatter = Lograge::Formatters::Logstash.new
end