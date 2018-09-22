# frozen_string_literal: true

# == Schema Information
#
# Table name: long_term_stocks
#
#  id           :bigint(8)        not null, primary key
#  stock_symbol :string(10)       not null
#  action       :string(10)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  notified_at  :datetime
#  cost         :float
#  acked_at     :datetime
#

class LongTermStock < ApplicationRecord
  SELL_ACTION = 'sell'
  HOLD_ACTION = 'hold'
  NULL_ACTION = 'null'

  validates :action, inclusion: { in: [SELL_ACTION, HOLD_ACTION, NULL_ACTION] }

  scope :to_hold, -> { where(action: HOLD_ACTION) }
  scope :to_sell, -> { where(action: SELL_ACTION) }

  scope :to_notify, -> { to_sell.where(acked_at: nil) }

  def need_ack?
    action == LongTermStock::SELL_ACTION && acked_at.blank?
  end
end
