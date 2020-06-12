class ChangeUserNameToFirstNameAndLastName < ActiveRecord::Migration[6.0]
  def change
      rename_column :users, :name, :first_name
      add_column :users, :last_name, :string
  end
end
