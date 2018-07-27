# frozen_string_literal: true
# == Schema Information
#
# Table name: stocks
#
#  id           :bigint(8)        not null, primary key
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

FactoryBot.define do
  factory :stock do
    symbol 'MyString'
    company_name 'MyString'
    description 'MyText'
    sector 'MyString'
    note 'MyText'
  end
end
