class AddFieldsToCargo < ActiveRecord::Migration[5.0]
  def change
    add_column :cargoes, :number, :string
    add_column :cargoes, :capacity, :integer
    add_column :cargoes, :weight, :integer

  end
end
