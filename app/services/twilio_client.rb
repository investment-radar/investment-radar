# frozen_string_literal: true

module TwilioClient
  FROM_NUMBER = '+61488839883'
  VOICE_URL = 'https://quiet-beyond-43735.herokuapp.com/voice.xml'

  def self.build
    secrets = Rails.application.secrets
    account_sid = secrets.twilio_account_sid
    auth_token = secrets.twilio_auth_token

    Twilio::REST::Client.new account_sid, auth_token
  end
end
