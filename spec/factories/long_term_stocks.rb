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

FactoryBot.define do
  factory :long_term_stock do
    stock_symbol 'SHOP'
    action 'hold'
    cost 100.10
    shares 200
  end
end
