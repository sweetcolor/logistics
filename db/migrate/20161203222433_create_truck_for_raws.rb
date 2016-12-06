class CreateTruckForRaws < ActiveRecord::Migration[5.0]
  def change
    create_table :truck_for_raws do |t|
      t.integer :capacity
      t.integer :truck_id

      t.timestamps
    end
    add_foreign_key :truck_for_raws, :trucks
  end
end
