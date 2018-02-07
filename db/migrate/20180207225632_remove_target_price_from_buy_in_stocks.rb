class RemoveTargetPriceFromBuyInStocks < ActiveRecord::Migration[5.1]
  def change
    remove_column :buy_in_stocks, :target_price, :float
  end
end
