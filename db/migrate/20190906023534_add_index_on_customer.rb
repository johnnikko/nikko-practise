class AddIndexOnCustomer < ActiveRecord::Migration[5.2]
  def change
    add_index :customers, :user_id
  end
end
