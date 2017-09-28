class CreateLongTermStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :long_term_stocks do |t|
      t.string :stock_symbol, limit: 10, null: false
      t.float :target_price, null: false
      t.float :bid_price
      t.float :last_trade_price
      t.string :action, limit: 10

      t.timestamps
    end
  end
end
