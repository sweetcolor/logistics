class CreateTrucks < ActiveRecord::Migration[5.0]
  def change
    create_table :trucks do |t|
      t.string :name, null:false
      t.string :number, null:false, index: true
      t.string :mark, null:false
      t.integer :capacity_hold, null:false
      t.integer :capacity_fuel, null:false
      t.integer :average_speed

      t.timestamps
    end
  end
end
