class AddMa30ToLongTermStocks < ActiveRecord::Migration[5.2]
  def change
    add_column :long_term_stocks, :ma30, :float
  end
end
