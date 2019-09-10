class CreateReturnMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :return_movies do |t|
      t.integer :user_id
      t.integer :transaction_id
      t.integer :quantity
      t.timestamps
    end
    add_index(:return_movies, :user_id)
    add_index(:return_movies, :transaction_id)
  end
end
