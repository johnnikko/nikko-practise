class AddIndexEmployeeId < ActiveRecord::Migration[5.2]
  def change
    add_index :employees, :employee_id
  end
end
