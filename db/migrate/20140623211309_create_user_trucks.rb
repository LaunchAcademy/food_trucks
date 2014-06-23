class CreateUserTrucks < ActiveRecord::Migration
  def change
    create_table :user_trucks do |t|
      t.integer :user_id, null: false
      t.integer :food_truck_id, null: false

      t.timestamps
    end
  end
end
