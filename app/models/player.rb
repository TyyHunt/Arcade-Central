class Player < ApplicationRecord
    has_secure_password
    
    has_many :games
    has_many :arcades, through: :games

    validates :username, presence: true
    validates :username, uniqueness: true
    validates :password, length: { in: 6..20 }
end
