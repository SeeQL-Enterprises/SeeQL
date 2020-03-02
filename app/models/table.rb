class Table < ApplicationRecord
  belongs_to :database
  has_many :comments, as: :commentable
end
