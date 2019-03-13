# frozen_string_literal: true
# == Schema Information
#
# Table name: long_term_stocks
#
#  id           :bigint(8)        not null, primary key
#  stock_symbol :string(10)       not null
#  action       :string(10)       default("hold")
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  notified_at  :datetime
#  cost         :float            not null
#  acked_at     :datetime
#  stop_price   :float
#  shares       :integer          not null
#  ma30         :float
#

class LongTermStock < ApplicationRecord
  SELL_ACTION = 'sell'
  HOLD_ACTION = 'hold'
  NULL_ACTION = 'null'

  validates :action, inclusion: { in: [SELL_ACTION, HOLD_ACTION, NULL_ACTION] }
  validates_presence_of :stock_symbol, :cost, :shares

  scope :to_hold, -> { where(action: HOLD_ACTION) }
  scope :to_sell, -> { where(action: SELL_ACTION) }

  scope :to_notify, -> { to_sell.where(acked_at: nil) }

  def need_ack?
    action == LongTermStock::SELL_ACTION && acked_at.blank?
  end

  def caculated_stop_price
    return 0 unless ma30

    tmp_price = cost * 0.92
    (tmp_price > ma30 ? tmp_price : ma30).round(2)
  end

  def caculated_risk
    if caculated_stop_price < cost
      ((cost - caculated_stop_price) / cost * 100).round(2)
    else
      return 0
    end
  end

  def caculated_lost
    ((cost - caculated_stop_price) * shares).round
  end

  def total_cost
    (cost * shares).to_i
  end
end
