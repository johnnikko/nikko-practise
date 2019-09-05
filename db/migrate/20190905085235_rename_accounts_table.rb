class RenameAccountsTable < ActiveRecord::Migration[5.2]
  def self.up
    rename_table :accounts, :users
  end
end
