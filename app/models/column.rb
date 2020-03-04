class Column < ApplicationRecord
  belongs_to :table
   has_many :comments, as: :commentable
end
