Rails.application.configure do
  config.lograge.enabled = true

  config.lograge.custom_options = ->(event) do
    exceptions = %w(controller action utf8 authenticity_token)

    {
      params: event.payload[:params].except(*exceptions),
      time: event.time.iso8601,
      host: event.payload[:host],
      user_id: event.payload[:user_id]
    }
  end
end