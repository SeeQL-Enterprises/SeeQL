class ChangeColumnsDataTypeToString < ActiveRecord::Migration[5.2]
  def change
    change_column :columns, :data_type, :string
  end
end
