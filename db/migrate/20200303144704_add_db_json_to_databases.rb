class AddDbJsonToDatabases < ActiveRecord::Migration[5.2]
  def change
    add_column :databases, :db_json, :json
  end
end
