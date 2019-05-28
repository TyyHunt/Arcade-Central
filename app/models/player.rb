class Player < ApplicationRecord
    has_secure_password
    
    has_many :games
    has_many :arcades, through: :games

    validates :username, presence: true
    validates :username, uniqueness: true
    validates :password, length: { in: 6..20 }

    def self.from_omniauth(auth)
        where(uid: auth.uid).first_or_initialize.tap do |user|
          user.uid = auth.uid
          user.username = auth.info.name
          user.oauth_token = auth.credentials.token
          user.save!
        end
      end
end
