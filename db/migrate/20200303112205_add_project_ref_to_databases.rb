class AddProjectRefToDatabases < ActiveRecord::Migration[5.2]
  def change
    add_reference :databases, :project, foreign_key: true
  end
end
