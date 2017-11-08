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
  SELL_ACTION = "sell".freeze
  HOLD_ACTION = "hold".freeze

  def update_action(bid_price, last_trade_price)
    return unless bid_price.present?

    if bid_price < target_price
      action = SELL_ACTION
    else
      action = HOLD_ACTION
    end

    update(action: action, bid_price: bid_price, last_trade_price: last_trade_price)
  end
end
