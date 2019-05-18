class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :name
      t.integer :num_players
      t.float :cost
      t.boolean :working
      t.integer :arcade_id
      t.integer :player_id
      
      t.timestamps
    end
  end
end
