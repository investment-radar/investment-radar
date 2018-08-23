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
#

FactoryBot.define do
  factory :long_term_stock do
    stock_symbol 'shop'
    action 'hold'
  end
end
