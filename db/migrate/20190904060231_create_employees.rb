class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.string :status
      t.string :position
      t.string :contact_number
      t.string :address
    end
  end
end
