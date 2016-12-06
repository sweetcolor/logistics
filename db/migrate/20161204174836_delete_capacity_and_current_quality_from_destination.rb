class DeleteCapacityAndCurrentQualityFromDestination < ActiveRecord::Migration[5.0]
  def change
    remove_column :destinations, :capacity
    remove_column :destinations, :current_quantity
  end
end
