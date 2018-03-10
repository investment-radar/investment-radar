# frozen_string_literal: true

class TwilioSmsService
  include Concerns::Service

  attr_reader :message, :phone_number

  def initialize(message, phone_number)
    @message = message
    @phone_number = phone_number
  end

  def call
    send_message
  end

  private

  def send_message
    TwilioClient.build.messages.create(
      from: TwilioClient::FROM_NUMBER,
      to: phone_number,
      body: message
    )
  end
end
