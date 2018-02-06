# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FinanceClient::DecisionEngine, :api_client do
  describe '.long_term_stock' do
    subject(:stock_decision) { described_class.long_term_stock(stock_symbol) }

    let(:stock_symbol) { 'team' }

    it 'returns sell decision' do
      stub_long_term_stocks(stock_symbol)

      is_expected.to include_json(
        symbol: stock_symbol,
        decision: 'sell'
      )
    end
  end
end
