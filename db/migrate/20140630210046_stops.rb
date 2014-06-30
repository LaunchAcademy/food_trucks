class Stops < ActiveRecord::Migration
  def change
    create_table :stops do |t|
      t.string :location_id, null: false
      t.float :food_truck_id, null: false
      t.float :time_arrive, null: false
    end
  end
end
