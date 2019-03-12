# == Schema Information
#
# Table name: trading_records
#
#  id         :bigint(8)        not null, primary key
#  symbol     :string           not null
#  direction  :string           not null
#  volume     :integer          not null
#  price      :float            not null
#  deal_time  :datetime         not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TradingRecord < ApplicationRecord
end
