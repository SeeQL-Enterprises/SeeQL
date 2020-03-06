class RemoveUserFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :users
  end
end
