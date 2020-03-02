class Comment < ApplicationRecord
  belongs_to :table
  belongs_to :column
  belongs_to :user
end
