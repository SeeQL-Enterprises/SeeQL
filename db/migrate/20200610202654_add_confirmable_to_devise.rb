class AddConfirmableToDevise < ActiveRecord::Migration[6.0]
  def change
      add_index :users, :confirmation_token,   unique: true
  end
end
