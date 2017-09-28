require 'rails_helper'

RSpec.describe NoticesMailer do
  let(:email) { "user_abc@example.com" }

  subject(:mail) { NoticesMailer.notify_to_sell(email: email) }

  before do
    create(:long_term_stock, stock_symbol: 'tsla', action: 'sell', bid_price: 111.11)
    create(:long_term_stock, stock_symbol: 'shop', action: 'hold', last_trade_price: 101.12)
  end

  describe '#notify_to_sell' do
    it 'renders the headers' do
      expect(mail.subject).to eql "Stock: sell-TSLA hold-SHOP"
      expect(mail.to).to eq(["user_abc@example.com"])
      expect(mail.from).to eq(["bing708@gmail.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Bid: 111.11")
      expect(mail.body.encoded).to match("Last: 101.12")
    end
  end
end
