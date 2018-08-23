# frozen_string_literal: true

# == Schema Information
#
# Table name: buy_in_stocks
#
#  id           :bigint(8)        not null, primary key
#  stock_symbol :string           not null
#  cost_price   :float            not null
#  action       :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class BuyInStock < ApplicationRecord
end
