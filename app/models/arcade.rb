class Arcade < ApplicationRecord
    validates :name, :open_time, :close_time, :est_year, presence: true
    validates :name, uniqueness: true
    validates_inclusion_of :open_time, :close_time, :in => 1..12
    validates :est_year, :numericality => { greater_than_or_equal_to: 1970, less_than_or_equal_to: Time.now.year }

    has_many :games, :dependent => :delete_all
    has_many :players, through: :games

    def self.abc_order
        order(:name)
    end

    def self.highest_num_games
        joins(:games).group('arcades.id').order('count(games.arcade_id) DESC').first
    end
end
