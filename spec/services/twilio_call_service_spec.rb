# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TwilioCallService do
  describe '.call' do
    let(:number) { '+61455500123' }

    # rubocop:disable RSpec/VerifiedDoubles
    it 'calls twilio messages api' do
      client = spy('Client')
      calls = spy('calls')

      allow(TwilioClient).to receive(:build).and_return(client)
      allow(client).to receive(:calls).and_return(calls)

      described_class.call(number)

      expect(calls).to have_received(:create).with(
        from: TwilioClient::FROM_NUMBER,
        to: number,
        url: TwilioClient::VOICE_URL,
        method: 'GET'
      )
    end
    # rubocop:enable RSpec/VerifiedDoubles
  end
end
