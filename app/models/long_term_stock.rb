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

  def update_action(result)
    return unless result.bid

    if result.bid.to_f < target_price
      action = SELL_ACTION
    else
      action = HOLD_ACTION
    end

    update(action: action, bid_price: result.bid.to_f, last_trade_price: result.last_trade_price)
  end
end
