class AddEditToTables < ActiveRecord::Migration[5.2]
  def change
    add_column :tables, :edit, :boolean, default: false
  end
end
