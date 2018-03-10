# frozen_string_literal: true

class TwilioCallService
  include Concerns::Service

  attr_reader :phone_number

  def initialize(phone_number)
    @phone_number = phone_number
  end

  def call
    make_phone_call
  end

  private

  def make_phone_call
    TwilioClient.build.calls.create(
      to: phone_number,
      from: TwilioClient::FROM_NUMBER,
      url: 'https://quiet-beyond-43735.herokuapp.com/voice.xml',
      method: 'GET'
    )
  end
end
