class AddCapacityToTruckForProduction < ActiveRecord::Migration[5.0]
  def change
    add_column :truck_for_productions, :capacity, :integer
  end
end
