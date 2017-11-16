class CreateBuyInStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :buy_in_stocks do |t|
      t.string :stock_symbol, null: false
      t.float :cost_price, null: false
      t.float :target_price
      t.string :action

      t.timestamps
    end
  end
end
