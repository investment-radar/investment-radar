class ChangeSharesNotNullOnLongTermStocks < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:long_term_stocks, :shares, false)
  end
end
