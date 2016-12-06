class CreateFuels < ActiveRecord::Migration[5.0]
  def change
    create_table :fuels do |t|
      t.string :mark
      t.integer :price

      t.timestamps
    end
    add_column :trucks, :fuel_id, :integer, null: false
    add_foreign_key :trucks, :fuels
    rename_column :trucks, :capacity_hold, :fuel_consumption
  end
end
