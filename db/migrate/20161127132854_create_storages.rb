class CreateStorages < ActiveRecord::Migration[5.0]
  def change
    create_table :storages do |t|
      t.integer :destination_id, null: false, unique: true
      t.timestamps
    end
  end
end
