class AddCostToLongTermStocks < ActiveRecord::Migration[5.2]
  def change
    add_column :long_term_stocks, :cost, :float
  end
end
