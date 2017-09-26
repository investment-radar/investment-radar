require 'rails_helper'

RSpec.describe StockService do

  let(:yahoo_client) { YahooFinance::Client.new }

  context "when mocks the yahoo client quoties API" do
    let(:bid_price) { nil }
    let(:stockes)   { LongTermStock.all }

    before do
      LongTermStock.create(stock_symbol: 'tsla', target_price: 351.64)

      yahoo_result = OpenStruct.new(bid: bid_price, last_trade_price: "351.09", symbol: "tsla")
      allow(yahoo_client).to receive(:quotes).and_return([yahoo_result])

      described_class.call(stockes, yahoo_client)
    end
  end

  context "when call the real yahoo api" do
    it "returns 2 results" do
      expect(subject.size).to eq 2

      shop_result = subject.first
      expect(shop_result.last_trade_price).not_to be_nil
      expect(shop_result.symbol).to eq 'shop'
      expect(shop_result.target_price).to eq 98.0

      tsla_result = subject.last
      expect(tsla_result.last_trade_price).not_to be_nil
      expect(tsla_result.symbol).to eq 'tsla'
      expect(tsla_result.target_price).to eq 347.64
    end
  end

end
