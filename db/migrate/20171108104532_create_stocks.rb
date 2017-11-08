class CreateStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :stocks do |t|
      t.string :symbol, null: false
      t.string :company_name
      t.text :description
      t.string :sector
      t.text :note

      t.timestamps
    end
    add_index :stocks, :symbol, unique: true
    add_index :stocks, :sector
  end
end
