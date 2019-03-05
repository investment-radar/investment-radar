class ChangeActionDefaultToHoldOnLongTermStocks < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:long_term_stocks, :action, 'hold')
  end
end
