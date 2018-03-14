# frozen_string_literal: true

module TwilioClient
  FROM_NUMBER = '+61488811321'

  def self.build
    secrets = Rails.application.secrets
    account_sid = secrets.twilio_account_sid
    auth_token = secrets.twilio_auth_token

    Twilio::REST::Client.new account_sid, auth_token
  end
end
