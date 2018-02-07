# frozen_string_literal: true

require 'rails_helper'

RSpec.describe NoticesMailer do
  subject(:mail) { described_class.notify_to_sell(email: email) }

  let(:email) { 'user_abc@example.com' }

  before do
    create(:long_term_stock, stock_symbol: 'tsla', action: 'sell')
    create(:long_term_stock, stock_symbol: 'shop', action: 'hold')
  end

  describe '#notify_to_sell' do
    it 'renders the headers' do
      expect(mail.subject).to eql '(test) Stock: sell-TSLA hold-SHOP'
      expect(mail.to).to eq(['user_abc@example.com'])
      expect(mail.from).to eq(['bing708@gmail.com'])
    end
  end
end
