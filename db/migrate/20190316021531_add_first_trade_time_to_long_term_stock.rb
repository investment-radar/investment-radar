class AddFirstTradeTimeToLongTermStock < ActiveRecord::Migration[5.2]
  def change
    add_column :long_term_stocks, :first_trade_time, :datetime
  end
end
