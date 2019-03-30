class AddStatusToTradingRecords < ActiveRecord::Migration[5.2]
  disable_ddl_transaction!
  safety_assured

  def up
    add_column :trading_records, :status, :string
    change_column_default :trading_records, :status, "closed"
    add_index :trading_records, :status, algorithm: :concurrently
  end

  def down
    remove_index :trading_records, :status
    remove_column :trading_records, :status
  end
end
