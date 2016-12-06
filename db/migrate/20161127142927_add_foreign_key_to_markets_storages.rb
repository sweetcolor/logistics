class AddForeignKeyToMarketsStorages < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :storages, :destinations
    add_foreign_key :markets, :destinations
  end
end
