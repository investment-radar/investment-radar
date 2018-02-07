class RemovePricesFromLongTermStocks < ActiveRecord::Migration[5.1]
  def change
    remove_column :long_term_stocks, :target_price, :float
    remove_column :long_term_stocks, :bid_price, :float
    remove_column :long_term_stocks, :last_trade_price, :float
  end
end
