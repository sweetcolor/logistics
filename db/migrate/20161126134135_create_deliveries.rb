class CreateDeliveries < ActiveRecord::Migration[5.0]
  def change
    create_table :deliveries do |t|
      t.integer :quantity, null: false

      t.timestamps
    end
  end
end
