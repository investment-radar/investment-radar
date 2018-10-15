# == Schema Information
#
# Table name: watchlists
#
#  id         :bigint(8)        not null, primary key
#  symbol     :string           not null
#  reason     :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_watchlists_on_symbol  (symbol) UNIQUE
#

class Watchlist < ApplicationRecord
end
