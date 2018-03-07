class TwilioSmsService
  include Concerns::Service

  attr_reader :client, :message, :phone_number

  def initialize(message, phone_number)
    @message = message
    @phone_number = phone_number

    build_client
  end

  def call
    send_message
  end

  private

  def build_client
    account_sid = Rails.application.secrets.twilio_account_sid
    auth_token = Rails.application.secrets.twilio_auth_token

    @client ||= Twilio::REST::Client.new account_sid, auth_token
  end

  def send_message
    from = '+61439745451'
    client.messages.create(
      from: from,
      to: phone_number,
      body: message
    )
  end
end
