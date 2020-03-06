class AddForeignKeysToColumns < ActiveRecord::Migration[5.2]
  def change
    add_column :columns, :foreign_keys, :json
  end
end
