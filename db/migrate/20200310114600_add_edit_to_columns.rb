class AddEditToColumns < ActiveRecord::Migration[5.2]
  def change
    add_column :columns, :edit, :boolean, default: false
  end
end
