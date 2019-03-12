# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TwilioClient do
  describe '.build' do
    it 'calls Twilio::REST::Client new method' do
      allow(Twilio::REST::Client).to receive(:new)

      described_class.build

      credentials = Rails.application.credentials[Rails.env.to_sym]
      account_sid = credentials[:twilio_account_sid]
      auth_token = credentials[:twilio_auth_token]

      expect(Twilio::REST::Client).to have_received(:new)
        .with(account_sid, auth_token)
        .once
    end
  end
end
