# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LongTermStockService do
  let!(:long_term_stock) { create(:long_term_stock, stock_symbol: 'tsla') }
  let(:long_term_stockes) { LongTermStock.all }

  context 'when mocks the stock service API' do
    before do
      allow(FinanceClient::DecisionEngine).to receive(:long_term_stock).with('tsla').and_return('decision' => 'hold')
    end

    it 'updates the long term stock record' do
      stocks_result = described_class.call(long_term_stockes)
      expect(FinanceClient::DecisionEngine).to have_received(:long_term_stock).with('tsla').once
      expect(stocks_result.size).to eq 1

      long_term_stock.reload

      expect(long_term_stock.action).to eq 'hold'
    end
  end

  context 'when call the fake stock service api' do
    it 'updates the long term stock record'
  end
end
