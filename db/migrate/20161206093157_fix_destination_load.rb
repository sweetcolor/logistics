class FixDestinationLoad < ActiveRecord::Migration[5.0]
  def change
    add_column :destination_loads, :destination_id, :integer
    add_column :destination_loads, :cargo_id, :integer
    add_foreign_key :destination_loads, :destinations
    add_foreign_key :destination_loads, :cargoes
  end
end
