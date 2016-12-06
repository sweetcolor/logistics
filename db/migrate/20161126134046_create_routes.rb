class CreateRoutes < ActiveRecord::Migration[5.0]
  def change
    create_table :routes do |t|
      t.integer :length, null: false

      t.timestamps
    end
  end
end
