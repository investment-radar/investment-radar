class CreateTradingRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :trading_records do |t|
      t.string :symbol, null: false
      t.string :direction, null: false
      t.integer :volume, null: false
      t.float :price, null: false
      t.datetime :deal_time, null: false

      t.timestamps
    end
  end
end
