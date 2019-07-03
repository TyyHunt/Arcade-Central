class Game < ApplicationRecord
    belongs_to :arcade
    belongs_to :player

    validates :name, :num_players, :cost, :working, :arcade_id, presence: true
    validates :name, uniqueness: true
    validates_inclusion_of :num_players, :in => 1..6
    
    def self.abc_order
        order(:name)
    end

end
