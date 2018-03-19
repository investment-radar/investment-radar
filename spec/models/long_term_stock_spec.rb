# frozen_string_literal: true

# == Schema Information
#
# Table name: long_term_stocks
#
#  id           :integer          not null, primary key
#  stock_symbol :string(10)       not null
#  action       :string(10)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  notified_at  :datetime
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
      create(:long_term_stock, stock_symbol: 'team', action: LongTermStock::SELL_ACTION, notified_at: Time.current)
      create(:long_term_stock, stock_symbol: 'shop', action: LongTermStock::SELL_ACTION)
    end

    it { expect(notify_stocks.size).to eq 1 }
    it { expect(notify_stocks.first.stock_symbol).to eq 'shop' }
  end

  describe '.need_notify?' do
    subject(:need_notify) { long_term_stock.need_notify? }

    let(:long_term_stock) { build_stubbed(:long_term_stock, action: action, notified_at: notified_at) }

    context 'when action is hold and notified_at is nil' do
      let(:action) { LongTermStock::HOLD_ACTION }
      let(:notified_at) { nil }

      it { is_expected.to be false }
    end

    context 'when action is hold and notified_at is present' do
      let(:action) { LongTermStock::HOLD_ACTION }
      let(:notified_at) { Time.current }

      it { is_expected.to be false }
    end

    context 'when action is sold and notified_at is nil' do
      let(:action) { LongTermStock::SELL_ACTION }
      let(:notified_at) { nil }

      it { is_expected.to be true }
    end

    context 'when action is sold and notified_at is present' do
      let(:action) { LongTermStock::SELL_ACTION }
      let(:notified_at) { Time.current }

      it { is_expected.to be false }
    end
  end
end
