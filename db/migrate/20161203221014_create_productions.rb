class CreateProductions < ActiveRecord::Migration[5.0]
  def change
    create_table :productions do |t|
      t.string :name
      t.string :category
      t.integer :cargo_id

      t.timestamps
    end

    add_foreign_key :productions, :cargoes
  end
end
