class AddFieldsToDelivery < ActiveRecord::Migration[5.0]
  def change
    add_column :deliveries, :truck_id, :integer, null:false
    add_column :deliveries, :begin_date, :date, null:false
    add_column :deliveries, :begin_time, :time, null:false
    add_column :deliveries, :end_date, :date, null:false
    add_column :deliveries, :end_time, :time, null:false

    add_foreign_key :deliveries, :trucks
  end
end
