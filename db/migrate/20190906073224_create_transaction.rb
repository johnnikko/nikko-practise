class CreateTransaction < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :user_id
      t.integer :customer_id
      t.integer :movie_id
      t.timestamps
    end

    add_index(:transactions, :user_id)
    add_index(:transactions, :customer_id)
    add_index(:transactions, :movie_id)
  end
end
