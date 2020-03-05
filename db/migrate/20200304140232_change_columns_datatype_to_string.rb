class ChangeColumnsDatatypeToString < ActiveRecord::Migration[5.2]
  def change
    change_column :columns, :datatype, :string
  end
end
