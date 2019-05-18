class CreateArcades < ActiveRecord::Migration[5.2]
  def change
    create_table :arcades do |t|

      t.timestamps
    end
  end
end
