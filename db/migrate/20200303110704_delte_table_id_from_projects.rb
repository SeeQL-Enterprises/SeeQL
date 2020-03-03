class DelteTableIdFromProjects < ActiveRecord::Migration[5.2]
  def change
    remove_column :comments, :table_id
    remove_column :comments, :column_id
    remove_column :comments, :user_id
  end
end
