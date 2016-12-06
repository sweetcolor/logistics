class AddDestinationFkToTrucks < ActiveRecord::Migration[5.0]
  def change
    add_column :trucks, :destination_id, :integer
    add_foreign_key :trucks, :destinations
  end
end

