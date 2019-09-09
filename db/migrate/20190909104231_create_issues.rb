class CreateIssues < ActiveRecord::Migration[5.2]
  def change
    create_table :issues do |t|
      t.integer :movie_id
      t.text :description
      t.timestamps
    end
    add_index(:issues,:movie_id)
  end
end
