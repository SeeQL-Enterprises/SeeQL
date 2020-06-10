require 'open-uri'

class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :lockable, :timeoutable, :trackable
    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :confirmable, :omniauthable, omniauth_providers: %i[github]

    has_many :projects
    has_many :comments, as: :commentable

    has_one_attached :avatar

    def self.from_omniauth(auth)
        where(provider: auth.provider, uid: auth.uid).first_or_create! do |user|
            user.provider = auth.provider
            user.uid = auth.uid
            user.name = auth.info.name
            user.email = auth.info.email
            user.password = Devise.friendly_token[0, 20]

            user_avatar = URI.open(auth.info.image)
            user.avatar.attach(io: user_avatar, filename: 'avatar')

            user.skip_confirmation!
        end
    end
end
