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
#  status     :string           default("closed")
#
# Indexes
#
#  index_trading_records_on_status  (status)
#

class TradingRecord < ApplicationRecord
  def self.report
    records = TradingRecord.where(status: 'closed').order(deal_time: :desc)

    results = {}

    records.each do |record|
      if record.direction == 'sell'
        if results[record.symbol]
          results[record.symbol] += record.volume * record.price
        else
          results[record.symbol] = record.volume * record.price
        end
      elsif record.direction == 'buy'
        results[record.symbol] -= record.volume * record.price
      end
    end

    results
  end
end
