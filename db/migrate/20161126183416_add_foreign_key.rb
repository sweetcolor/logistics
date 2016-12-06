class AddForeignKey < ActiveRecord::Migration[5.0]
  def change
    add_column :destinations, :cargo_id, :integer, null: false
    add_column :deliveries, :cargo_id, :integer, null: false
    add_column :deliveries, :route_id, :integer, null: false
    add_column :routes, :begin_id, :integer, null: false
    add_column :routes, :end_id, :integer, null: false
    add_foreign_key :deliveries, :cargoes
    add_foreign_key :destinations, :cargoes
    add_foreign_key :deliveries, :routes
    add_foreign_key :routes, :destinations, column: :begin_id
    add_foreign_key :routes, :destinations, column: :end_id
  end
end
