# == Schema Information
#
# Table name: stocks
#
#  id           :integer          not null, primary key
#  symbol       :string           not null
#  company_name :string
#  description  :text
#  sector       :string
#  note         :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_stocks_on_sector  (sector)
#  index_stocks_on_symbol  (symbol) UNIQUE
#

require 'rails_helper'

RSpec.describe Stock, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
