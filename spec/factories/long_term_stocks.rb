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

FactoryGirl.define do
  factory :long_term_stock do
    stock_symbol "shop"
    target_price  100.5
  end
end
