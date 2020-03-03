class RemoveUserFromDatabases < ActiveRecord::Migration[5.2]
  def change
    remove_column :databases, :user_id
  end
end
