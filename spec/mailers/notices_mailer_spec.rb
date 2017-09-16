require 'rails_helper'

RSpec.describe NoticesMailer do
  let(:email) { "user_abc@example.com" }
  let(:symbol) { "APPL" }

  let(:mail) { NoticesMailer.notify_to_sell(email: email, symbol: symbol) }

  describe '#notify_to_sell' do
    it 'sends sell email' do
      expect(mail.subject).to eql "It's time to sell: APPL"
      expect(mail.to).to eq(["user_abc@example.com"])
      expect(mail.from).to eq(["bing708@gmail.com"])
    end
  end
end
