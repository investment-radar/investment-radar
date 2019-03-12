# frozen_string_literal: true

module TwilioClient
  FROM_NUMBER = '+61488839883'
  VOICE_URL = 'https://quiet-beyond-43735.herokuapp.com/voice.xml'

  def self.build
    credentials = Rails.application.credentials[Rails.env.to_sym]
    account_sid = credentials[:twilio_account_sid]
    auth_token = credentials[:twilio_auth_token]
    Twilio::REST::Client.new account_sid, auth_token
  end
end
