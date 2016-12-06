class CreateRawProducers < ActiveRecord::Migration[5.0]
  def change
    create_table :raw_producers do |t|
      t.integer :destination_id, null:false

      t.timestamps
    end
    add_foreign_key :raw_producers, :destinations
  end
end
