# lkdfjlksjfl

class Project < ApplicationRecord
  belongs_to :user

  has_many :databases
  has_many :collaborators, dependent: :destroy
end


# alsdkjlaskej