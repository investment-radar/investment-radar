require 'rails_helper'

RSpec.describe StockService do
  subject { described_class.call(stockes, yahoo_client) }

  let(:yahoo_client) { YahooFinance::Client.new }

  context "when mocks the yahoo client quoties API" do
    let(:bid_price)    { nil }

    before do
      yahoo_result = OpenStruct.new(bid: bid_price, last_trade_price: "351.09", symbol: "tsla")
      allow(yahoo_client).to receive(:quotes).and_return([yahoo_result])
    end

    context "when bid price great than target price" do
      let(:bid_price) { "350.54" }
      let(:stockes)   { { "tsla" => 351.64 } }

      it 'sets action to sell' do
        result = subject.first

        expect(result.action).to eq "sell"
        expect(result.target_price).to eq 351.64
      end
    end

    context "when bid price less than target price" do
      let(:bid_price) { "350.54" }
      let(:stockes) { { "tsla" => 349.64 } }

      it 'sets action to hold' do
        result = subject.first

        expect(result.action).to eq "hold"
        expect(result.target_price).to eq 349.64
      end
    end

    context "when bid price is nil" do
      let(:bid_price) { nil }
      let(:stockes) { { "tsla" => 349.64 } }

      it 'does not set the action' do
        result = subject.first

        expect(result.action).to be_nil
        expect(result.target_price).to eq 349.64
      end
    end
  end

  context "when call the real yahoo api" do
    let(:stockes) { { "shop" => 98.0, "tsla" => 347.64 } }

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
