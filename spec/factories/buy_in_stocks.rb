# == Schema Information
#
# Table name: buy_in_stocks
#
#  id           :integer          not null, primary key
#  stock_symbol :string           not null
#  cost_price   :float            not null
#  target_price :float
#  action       :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

FactoryBot.define do
  factory :buy_in_stock do
    stock_symbol "MyString"
    cost_price 1.5
    target_price 1.5
    action "MyString"
  end
end
