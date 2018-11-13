class AddOmniauthToUsers < ActiveRecord::Migration[5.2]
  disable_ddl_transaction!

  safety_assured

  def change
    add_column :users, :provider, :string
    add_index :users, :provider, algorithm: :concurrently
    add_column :users, :uid, :string
    add_index :users, :uid, algorithm: :concurrently
  end
end
