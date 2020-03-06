class Table < ApplicationRecord
  belongs_to :database

  has_many :columns
  has_many :comments, as: :commentable
  accepts_nested_attributes_for :columns, allow_destroy: true

  scope :displayed, -> { where(display: true) }
end
