class CreateDestinationLoads < ActiveRecord::Migration[5.0]
  def change
    create_table :destination_loads do |t|
      t.integer :capacity, null:false
      t.integer :current_quantity, null:false

      t.timestamps
    end

  end
end
