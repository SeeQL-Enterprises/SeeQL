class Column < ApplicationRecord
  belongs_to :table, optional: true
  has_many :comments, as: :commentable
end
