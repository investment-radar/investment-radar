require 'rails_helper'

RSpec.describe StockService do
  let!(:stock) { create(:long_term_stock, stock_symbol: 'tsla', target_price: 351.64) }
  let(:stockes) { LongTermStock.all }

  subject { described_class.call(stockes) }

  context "when mocks the stock API" do
    before do
      allow(FinanceClient::Stock).to receive(:quote).with('tsla').and_return({
          "latestPrice" => 350.06,
          "previousClose" => 351.09
        })
    end

    it 'updates the long term stock record' do
      expect(subject.size).to eq 1

      stock.reload

      expect(stock.bid_price).to eq 350.06
      expect(stock.last_trade_price).to eq 351.09
      expect(stock.action).to eq 'sell'
    end
  end

  context "when call the real stock api" do
    it "updates the long term stock record" do
      expect(subject.size).to eq 1

      tsla_result = subject.first

      expect(tsla_result.last_trade_price).not_to be_nil
      expect(tsla_result.bid_price).not_to be_nil
      expect(tsla_result.stock_symbol).to eq 'tsla'
    end
  end

end
