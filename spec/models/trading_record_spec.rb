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

require 'rails_helper'

RSpec.describe TradingRecord, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
