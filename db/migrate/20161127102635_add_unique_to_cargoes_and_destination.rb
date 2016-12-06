class AddUniqueToCargoesAndDestination < ActiveRecord::Migration[5.0]
  def change
    add_index :cargoes, :name, unique: true
    add_index :destinations, :name, unique: true
  end
end
