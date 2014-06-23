class CreateUserTrucks < ActiveRecord::Migration
  def change
    create_table :user_trucks do |t|
      t.integer :user_id
      t.integer :food_truck_id

      t.timestamps
    end
  end
end
