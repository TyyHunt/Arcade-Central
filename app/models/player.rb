class Player < ApplicationRecord
    has_secure_password

    has_many :games
    has_many :arcades, through: :games
end
