class CreateWatchlists < ActiveRecord::Migration[5.2]
  safety_assured

  def change
      create_table :watchlists do |t|
        t.string :symbol, null: false
        t.text :reason

        t.timestamps
      end

      add_index :watchlists, :symbol, unique: true
  end
end
