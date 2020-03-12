class Table < ApplicationRecord
  belongs_to :database
  after_create :create_id_column

  has_many :columns
  has_many :comments, as: :commentable
  accepts_nested_attributes_for :columns, allow_destroy: true

  scope :displayed, -> { where(display: true) }

  DATATYPES = ["serial", "string", "integer", "bigint", "foreign key"]

  private

  def create_id_column
    Column.create(name: 'id', datatype: 'bigint', edit: true, table: self)
  end
end
