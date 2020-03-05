class RemoveDbJsonFromDatabases < ActiveRecord::Migration[5.2]
  def change
    remove_column :databases, :db_json
  end
end
