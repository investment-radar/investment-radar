# == Schema Information
#
# Table name: long_term_stocks
#
#  id               :integer          not null, primary key
#  stock_symbol     :string(10)       not null
#  target_price     :float            not null
#  bid_price        :float
#  last_trade_price :float
#  action           :string(10)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'rails_helper'

RSpec.describe LongTermStock, type: :model do
  before { stock.update_action(bid_price, last_trade_price) }

  describe 'new created record #update_action' do
    let(:stock) { create(:long_term_stock, target_price: 100.5) }
    let(:last_trade_price) { 90.5 }

    context "when bid price less than target price" do
      let(:bid_price) { 100.00 }

      it "sets action to sell and sets bid_price and last_trade_price" do
        expect(stock.action).to eq 'sell'
        expect(stock.bid_price).to eq bid_price
        expect(stock.last_trade_price).to eq 90.5
      end
    end

    context "when bid price great than target price" do
      let(:bid_price) { 101.00 }

      it "sets action to hold and and sets bid_price and last_trade_price" do
        expect(stock.action).to eq 'hold'
        expect(stock.bid_price).to eq bid_price
        expect(stock.last_trade_price).to eq 90.5
      end
    end

    context "when bid price is nil" do
      let(:bid_price) { nil }

      it 'does not set the action, bid_price and last_trade_price' do
        expect(stock.action).to be_nil
        expect(stock.bid_price).to be_nil
        expect(stock.last_trade_price).to be_nil
      end
    end
  end

  describe "when alread has the bid_price, action and last_trade_price" do
    let(:stock) { create(:long_term_stock, target_price: 100.5, bid_price: 101.5, last_trade_price: 101.0, action: 'hold') }
    let(:last_trade_price) { 101.3 }

    context "when bid price less than target price" do
      let(:bid_price) { 100.00 }

      it "sets action to sell and updates bid_price and last_trade_price" do
        expect(stock.action).to eq 'sell'
        expect(stock.bid_price).to eq bid_price
        expect(stock.last_trade_price).to eq 101.3
      end
    end

    context "when bid price great than target price" do
      let(:bid_price) { 101.00 }

      it "sets action to hold and and updates bid_price and last_trade_price" do
        expect(stock.action).to eq 'hold'
        expect(stock.bid_price).to eq bid_price
        expect(stock.last_trade_price).to eq 101.3
      end
    end

    context "when bid price is nil" do
      let(:bid_price) { nil }

      it 'does not set the action, bid_price and last_trade_price' do
        expect(stock.action).to eq 'hold'
        expect(stock.bid_price).to eq 101.5
        expect(stock.last_trade_price).to eq 101.0
      end
    end
  end
end
