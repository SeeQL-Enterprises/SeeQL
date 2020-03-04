class Database < ApplicationRecord
  belongs_to :project

  has_many :tables
end
