class CreateColumns < ActiveRecord::Migration[5.2]
  def change
    create_table :columns do |t|
      t.references :table, foreign_key: true
      t.string :name
      t.integer :data_type

      t.timestamps
    end
  end
end
