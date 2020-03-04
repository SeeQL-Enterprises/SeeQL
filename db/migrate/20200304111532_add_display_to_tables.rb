class AddDisplayToTables < ActiveRecord::Migration[5.2]
  def change
    add_column :tables, :display, :boolean, default: false
  end
end
