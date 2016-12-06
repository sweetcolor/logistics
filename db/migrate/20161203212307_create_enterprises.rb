class CreateEnterprises < ActiveRecord::Migration[5.0]
  def change
    create_table :enterprises do |t|
      t.integer :destination_id, null: false

      t.timestamps
    end
    add_foreign_key :enterprises, :destinations
  end
end
