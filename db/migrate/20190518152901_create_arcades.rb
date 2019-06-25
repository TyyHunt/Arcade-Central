class CreateArcades < ActiveRecord::Migration[5.2]
  def change
    create_table :arcades do |t|
      t.string :name
      t.string :location
      t.integer :open_time
      t.integer :close_time
      t.integer :est_year
      t.string :owner_name
      
      t.timestamps
    end
  end
end
