class FixTrucks < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :trucks, :destinations
    remove_column :trucks, :destination_id

    add_column :truck_for_raws, :enterprise_id, :integer
    add_foreign_key :truck_for_raws, :enterprises
    add_column :truck_for_productions, :enterprise_id, :integer
    add_foreign_key :truck_for_productions, :enterprises
    add_column :truck_for_productions, :storage_id, :integer
    add_foreign_key :truck_for_productions, :storages
  end
end
