class AddIndexOnAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :employee_id, :integer
    add_index :accounts, :employee_id
  end
end
