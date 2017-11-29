# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LongTermStockService do
  subject(:stocks_result) { described_class.call(long_term_stockes) }

  let!(:long_term_stock) { create(:long_term_stock, stock_symbol: 'tsla', target_price: 351.64) }
  let(:long_term_stockes) { LongTermStock.all }

  context 'when mocks the stock service API' do
    before do
      allow(FinanceClient::Stock).to receive(:quote).with('tsla').and_return('latestPrice' => 350.06,
                                                                             'previousClose' => 351.09)
    end

    it 'updates the long term stock record' do
      expect(stocks_result.size).to eq 1

      long_term_stock.reload

      expect(long_term_stock.bid_price).to eq 350.06
      expect(long_term_stock.last_trade_price).to eq 351.09
      expect(long_term_stock.action).to eq 'sell'
    end
  end

  context 'when call the real stock service api' do
    it 'updates the long term stock record' do
      expect(stocks_result.size).to eq 1

      tsla_result = stocks_result.first

      expect(tsla_result.last_trade_price).not_to be_nil
      expect(tsla_result.bid_price).not_to be_nil
      expect(tsla_result.stock_symbol).to eq 'tsla'
    end
  end

end
