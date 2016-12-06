class CreateRaws < ActiveRecord::Migration[5.0]
  def change
    create_table :raws do |t|
      t.integer :capacity
      t.integer :cargo_id

      t.timestamps
    end
    add_foreign_key :raws, :cargoes
  end
end
