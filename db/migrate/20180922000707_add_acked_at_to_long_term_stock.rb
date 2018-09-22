class AddAckedAtToLongTermStock < ActiveRecord::Migration[5.2]
  def change
    add_column :long_term_stocks, :acked_at, :datetime
  end
end
