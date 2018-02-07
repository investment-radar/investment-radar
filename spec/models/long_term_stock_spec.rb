require 'rails_helper'

RSpec.describe LongTermStock, type: :model do
  describe '.hold' do
    subject(:hold_stocks) { described_class.hold }

    before do
      create(:long_term_stock, stock_symbol: 'team', action: LongTermStock::SELL_ACTION)
      create(:long_term_stock, stock_symbol: 'shop', action: LongTermStock::HOLD_ACTION)
    end

    it { expect(hold_stocks.size).to eq 1 }
    it { expect(hold_stocks.first.stock_symbol).to eq 'shop'}
  end
end
