class CreateDatabases < ActiveRecord::Migration[5.2]
  def change
    create_table :databases do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.text :schema_file

      t.timestamps
    end
  end
end
