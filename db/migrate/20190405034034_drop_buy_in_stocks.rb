# frozen_string_literal: true

class DropBuyInStocks < ActiveRecord::Migration[5.2]
  def up
    drop_table :buy_in_stocks
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
