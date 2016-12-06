class DeleteCargoFormDestination < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :destinations, :cargoes
    remove_column :destinations, :cargo_id
  end
end
