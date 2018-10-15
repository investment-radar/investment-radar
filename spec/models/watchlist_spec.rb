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

require 'rails_helper'

RSpec.describe Watchlist, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
