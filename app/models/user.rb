class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :confirmable

    has_many :projects
    has_many :comments, as: :commentable

    has_one_attached :avatar
end
