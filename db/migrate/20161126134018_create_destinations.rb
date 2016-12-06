class CreateDestinations < ActiveRecord::Migration[5.0]
  def change
    create_table :destinations do |t|
      t.string :name, null: false, unique: true
      t.integer :capacity, null: false

      t.timestamps
    end
  end
end
