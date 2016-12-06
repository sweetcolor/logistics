class AddAddressToDestination < ActiveRecord::Migration[5.0]
  def change
    add_column :destinations, :address, :string
  end
end
