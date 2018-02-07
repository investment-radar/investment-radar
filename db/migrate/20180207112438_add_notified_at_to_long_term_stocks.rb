class AddNotifiedAtToLongTermStocks < ActiveRecord::Migration[5.1]
  def change
    add_column :long_term_stocks, :notified_at, :datetime
  end
end
