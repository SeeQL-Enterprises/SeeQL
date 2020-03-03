class RemoveSchemaColumnFromDatabases < ActiveRecord::Migration[5.2]
  def change
    remove_column :databases, :schema_file
  end
end
