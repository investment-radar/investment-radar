# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FinanceClient::Stock, :api_client do
  describe '#quote' do
    subject(:body) { described_class.quote(stock_symbol) }

    let(:stock_symbol) { 'team' }

    before { stub_quote_request(stock_symbol) }

    it { is_expected.to include 'symbol' => 'TEAM' }

    it { expect(body['latestPrice']).to eq 53.99 }
  end
end
