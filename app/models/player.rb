class Player < ApplicationRecord
    has_secure_password
    validates :username, presence: true
    validates :username, uniqueness: true
    validates :password, length: { in: 6..20 }

    has_many :games
    has_many :arcades, through: :games
end
