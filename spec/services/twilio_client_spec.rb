# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TwilioClient do
  describe '.build' do
    it 'calls Twilio::REST::Client new method' do
      allow(Twilio::REST::Client).to receive(:new)

      described_class.build

      expect(Twilio::REST::Client).to have_received(:new)
        .with(
          Rails.application.secrets.twilio_account_sid,
          Rails.application.secrets.twilio_auth_token
        ).once
    end
  end
end
