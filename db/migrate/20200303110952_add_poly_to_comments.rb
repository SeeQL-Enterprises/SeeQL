class AddPolyToComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :commentable, polymorphic: true
  end
end
