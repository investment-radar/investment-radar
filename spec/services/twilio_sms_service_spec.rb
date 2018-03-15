# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TwilioSmsService do
  describe '.call' do
    let(:text) { 'Hello, Radar.' }
    let(:number) { '+61455500123' }

    # rubocop:disable RSpec/VerifiedDoubles
    it 'calls twilio messages api' do
      client = spy('Client')
      messages = spy('messages')

      allow(TwilioClient).to receive(:build).and_return(client)
      allow(client).to receive(:messages).and_return(messages)

      described_class.call(text, number)

      expect(messages).to have_received(:create).with(from: TwilioClient::FROM_NUMBER, to: number, body: text)
    end
    # rubocop:enable RSpec/VerifiedDoubles
  end
end
