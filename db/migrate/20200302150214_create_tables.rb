class CreateTables < ActiveRecord::Migration[5.2]
  def change
    create_table :tables do |t|
      t.references :database, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
