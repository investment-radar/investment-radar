# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LongTermStockService do
  subject(:stocks_to_notify) { described_class.call(long_term_stockes) }

  let!(:long_term_stock) { create(:long_term_stock, stock_symbol: 'tsla') }
  let(:long_term_stockes) { LongTermStock.all }

  before do
    allow(FinanceClient::DecisionEngine).to receive(:long_term_stock).with('tsla').and_return('decision' => decision)
  end

  context 'when api return hold decision' do
    let(:decision) { 'hold' }

    it 'updates the long term stock record to hold' do
      expect(stocks_to_notify.size).to eq 0

      expect(FinanceClient::DecisionEngine).to have_received(:long_term_stock).with('tsla').once

      long_term_stock.reload

      expect(long_term_stock.action).to eq 'hold'
    end
  end

  context 'when api return sold decision' do
    let(:decision) { 'sell' }

    it 'updates the long term stock record to sell' do
      expect(stocks_to_notify.size).to eq 1

      expect(FinanceClient::DecisionEngine).to have_received(:long_term_stock).with('tsla').once

      long_term_stock.reload

      expect(long_term_stock.action).to eq 'sell'
    end
  end
end
