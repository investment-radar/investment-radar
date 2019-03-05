class AddSharesToLongTermStocks < ActiveRecord::Migration[5.2]
  def change
    add_column :long_term_stocks, :shares, :integer
  end
end
