class Table < ApplicationRecord
  belongs_to :database

  has_many :comments, as: :commentable
  has_many :columns
end
