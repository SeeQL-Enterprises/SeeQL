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
            # This takes the provider's name (here GitHub) and saves that info for devise
            # Same with UID (UserID)
            user.provider = auth.provider
            user.uid = auth.uid

            # GitHub only has 'name', so here we separate the names manually
            # Might not be perfect (some have 2 first names), but users can always edit that
            separate_names = auth.info.name.split(' ')
            user.first_name = separate_names[0]
            user.last_name = separate_names[1..-1].join(' ')

            user.email = auth.info.email
            user.password = Devise.friendly_token[0, 20]

            user_avatar = URI.open(auth.info.image)
            user.avatar.attach(io: user_avatar, filename: 'avatar')

            user.skip_confirmation!
        end
    end
end
