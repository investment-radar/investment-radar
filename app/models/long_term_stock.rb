# frozen_string_literal: true

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

class LongTermStock < ApplicationRecord
  SELL_ACTION = 'sell'
  HOLD_ACTION = 'hold'

  scope :hold, -> { where(action: HOLD_ACTION) }
end
