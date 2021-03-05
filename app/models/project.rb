class Project < ApplicationRecord
    belongs_to :user

    has_many :databases
    has_many :collaborators, dependent: :destroy

    has_one_attached :project_image

    validates :name, presence: true, on: :create
end
