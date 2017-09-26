require 'rails_helper'

RSpec.describe LongTermStock, type: :model do
  describe '#update_action' do
    let(:stock)      { LongTermStock.create(stock_symbol: 'shop', target_price: 100.5) }
    let(:result)     { OpenStruct.new(bid: bid_price, last_trade_price: "90.5", symbol: "shop") }

    before { stock.update_action(result) }

    context "when bid price less than target price" do
      let(:bid_price)  { "100.00" }

      it "sets action to sell" do
        expect(stock.action).to eq 'sell'
        expect(stock.bid_price).to eq 100.00
        expect(stock.last_trade_price).to eq 90.5
      end
    end

    context "when bid price great than target price" do
      let(:bid_price)  { "101.00" }

      it "sets action to hold" do
        expect(stock.action).to eq 'hold'
        expect(stock.bid_price).to eq 101.00
        expect(stock.last_trade_price).to eq 90.5
      end
    end

    context "when bid price is nil" do
      let(:bid_price) { nil }

      it 'does not set the action' do
        expect(result.action).to be_nil
        expect(stock.bid_price).to be_nil
        expect(stock.last_trade_price).to be_nil
      end
    end

    context "when alread has the bid_price, action and last_trade_price" do

    end
  end
end
