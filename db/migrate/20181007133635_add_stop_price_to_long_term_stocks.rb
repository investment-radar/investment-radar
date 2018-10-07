class AddStopPriceToLongTermStocks < ActiveRecord::Migration[5.2]
  def change
    add_column :long_term_stocks, :stop_price, :float
  end
end
