require 'rails_helper'

RSpec.describe StockService do

  let(:yahoo_client) { YahooFinance::Client.new }
  let(:yahoo_result) { OpenStruct.new(bid: "350.06", last_trade_price: "351.09", symbol: "tsla") }
  let(:stockes) { LongTermStock.all }

  subject { described_class.call(stockes, yahoo_client) }

  before do
    LongTermStock.create(stock_symbol: 'tsla', target_price: 351.64)
  end

  context "when mocks the yahoo client quoties API" do
    before do
      allow(yahoo_client).to receive(:quotes).and_return([yahoo_result])
    end

    it 'updates the long term stock record' do
      expect(subject.size).to eq 1
      stock = LongTermStock.last

      expect(stock.bid_price).to eq 350.06
      expect(stock.last_trade_price).to eq 351.09
      expect(stock.action).to eq 'sell'
    end
  end

  context "when call the real yahoo api" do
    it "updates the long term stock record" do
      expect(subject.size).to eq 1

      tsla_result = subject.first

      expect(tsla_result.last_trade_price).not_to be_nil
      expect(tsla_result.symbol).to eq 'tsla'
    end
  end

end
