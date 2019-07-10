class ArcadeSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :open_time, :close_time, :est_year, :owner_name
  
  has_many :games
end
