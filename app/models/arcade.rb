class Arcade < ApplicationRecord
    has_many :games
    has_many :players, through: :games

    validates :name, :open_time, :close_time, :est_year, presence: true
    validates :name, uniqueness: true
    validates_inclusion_of :open_time, :close_time, :in => 1..12
    validates :est_year, :numericality => { greater_than_or_equal_to: 1970, less_than_or_equal_to: Time.now.year }
end
