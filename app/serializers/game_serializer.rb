class GameSerializer < ActiveModel::Serializer
  attributes :id, :name, :num_players, :cost, :working, :arcade_id, :player_id
  
  belongs_to :arcade
end
