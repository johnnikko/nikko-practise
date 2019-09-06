class CreateCustomer < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :gender
      t.string :status
      t.string :age
      t.string :email
      t.string :address
      t.integer :user_id
      t.timestamps
    end
    add_index(:users, :user_id)
  end
end
