class Table < ApplicationRecord
  belongs_to :database
  
  has_many :columns
  has_many :comments, as: :commentable
  
  scope :displayed, -> { where(display: true) }
end
