class CreateTruckForProductions < ActiveRecord::Migration[5.0]
  def change
    create_table :truck_for_productions do |t|
      t.integer :truck_id

      t.timestamps
    end
    add_foreign_key :truck_for_productions, :trucks
  end
end
