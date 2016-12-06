class AddCurrentQuantityToDestination < ActiveRecord::Migration[5.0]
  def change
    add_column :destinations, :current_quantity, :integer, null: false
  end
end
