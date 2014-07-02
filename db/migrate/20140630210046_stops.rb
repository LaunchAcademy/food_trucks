class Stops < ActiveRecord::Migration
  def change
    create_table :stops do |t|
      t.integer :location_id, null: false
      t.integer :food_truck_id, null: false
      t.datetime :time_arrive, null: false
    end
  end
end
