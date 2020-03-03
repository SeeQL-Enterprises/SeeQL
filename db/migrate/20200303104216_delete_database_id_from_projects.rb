class DeleteDatabaseIdFromProjects < ActiveRecord::Migration[5.2]
  def change
    remove_column :projects, :database_id
  end
end
