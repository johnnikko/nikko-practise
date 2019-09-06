class RemoveIndex < ActiveRecord::Migration[5.2]
  def change
    remove_column(:users, :index_users_on_user_id)
  end
end
