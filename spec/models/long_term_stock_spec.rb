# frozen_string_literal: true
# == Schema Information
#
# Table name: long_term_stocks
#
#  id               :bigint(8)        not null, primary key
#  stock_symbol     :string(10)       not null
#  action           :string(10)       default("hold")
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  notified_at      :datetime
#  cost             :float            not null
#  acked_at         :datetime
#  stop_price       :float
#  shares           :integer          not null
#  ma30             :float
#  first_trade_time :datetime
#

require 'rails_helper'

RSpec.describe LongTermStock, type: :model do
  it { is_expected.to validate_inclusion_of(:action).in_array(%w[hold sell]) }

  describe '.to_hold' do
    subject(:hold_stocks) { described_class.to_hold }

    before do
      create(:long_term_stock, stock_symbol: 'team', action: LongTermStock::SELL_ACTION)
      create(:long_term_stock, stock_symbol: 'shop', action: LongTermStock::HOLD_ACTION)
    end

    it { expect(hold_stocks.size).to eq 1 }
    it { expect(hold_stocks.first.stock_symbol).to eq 'shop' }
  end

  describe '.to_sell' do
    subject(:sell_stocks) { described_class.to_sell }

    before do
      create(:long_term_stock, stock_symbol: 'team', action: LongTermStock::SELL_ACTION)
      create(:long_term_stock, stock_symbol: 'shop', action: LongTermStock::HOLD_ACTION)
    end

    it { expect(sell_stocks.size).to eq 1 }
    it { expect(sell_stocks.first.stock_symbol).to eq 'team' }
  end

  describe '.to_notify' do
    subject(:notify_stocks) { described_class.to_notify }

    before do
      create(:long_term_stock, stock_symbol: 'team', action: LongTermStock::SELL_ACTION, acked_at: Time.current)
      create(:long_term_stock, stock_symbol: 'shop', action: LongTermStock::SELL_ACTION)
    end

    it { expect(notify_stocks.size).to eq 1 }
    it { expect(notify_stocks.first.stock_symbol).to eq 'shop' }
  end

  describe '#need_ack?' do
    subject(:need_ack) { long_term_stock.need_ack? }

    let(:long_term_stock) { build_stubbed(:long_term_stock, action: action, acked_at: acked_at) }

    context 'when action is hold and acked_at is nil' do
      let(:action) { LongTermStock::HOLD_ACTION }
      let(:acked_at) { nil }

      it { is_expected.to be false }
    end

    context 'when action is hold and acked_at is present' do
      let(:action) { LongTermStock::HOLD_ACTION }
      let(:acked_at) { Time.current }

      it { is_expected.to be false }
    end

    context 'when action is sold and acked_at is nil' do
      let(:action) { LongTermStock::SELL_ACTION }
      let(:acked_at) { nil }

      it { is_expected.to be true }
    end

    context 'when action is sold and acked_at is present' do
      let(:action) { LongTermStock::SELL_ACTION }
      let(:acked_at) { Time.current }

      it { is_expected.to be false }
    end
  end

  describe '#calculated_stop_price' do
    let(:stock) { build(:long_term_stock, cost: 100.00) }

    before do
      allow(stock).to receive(:calculated_ma30).and_return(ma30)
    end

    context 'when ma30 is nil' do
      let(:ma30) { nil }

      it 'returns max_lost_price' do
        expect(stock.calculated_stop_price).to eq 92.0
      end
    end

    context 'when ma30 is larger then the 8 percentage lost price' do
      let(:ma30) { 93.05 }

      it 'returns ma30 price' do
        expect(stock.calculated_stop_price).to eq ma30
      end
    end

    context 'when ma30 is less then the 8 percentage lost price' do
      let(:ma30) { 91.05 }

      it 'returns ma30 price' do
        expect(stock.calculated_stop_price).to eq 92.00
      end
    end
  end

  describe '#total_cost' do
    it 'calculates total cost with cost and shares' do
      stock = build(:long_term_stock, cost: 10.5, shares: 50)
      expect(stock.total_cost).to eq 525
    end

    it 'returns 0 when shares is 0' do
      stock = build(:long_term_stock, cost: 10.5, shares: 0)
      expect(stock.total_cost).to eq 0
    end
  end

  describe '#market_value' do
    it 'calculates market value with latest price and shares' do
      stock = build(:long_term_stock, shares: 50)
      allow(stock).to receive(:latest_price).and_return(22.3)

      expect(stock.market_value).to eq 1115
    end
  end

  describe '#calculated_risk' do
    it 'returns the percentage of risk' do
      stock = build(:long_term_stock, cost: 50)
      allow(stock).to receive(:calculated_stop_price).and_return(45.6)
      expect(stock.calculated_risk).to eq 8.8
    end
  end

  describe '#calculated_lost' do
    it 'returns the total in risk' do
      stock = build(:long_term_stock, cost: 50.71, shares: 100)
      allow(stock).to receive(:calculated_stop_price).and_return(45.6)
      expect(stock.calculated_lost).to eq 511
    end
  end
end
