class AddForeignKeysToTables < ActiveRecord::Migration[5.2]
  def change
    add_column :tables, :foreign_keys, :json
  end
end
