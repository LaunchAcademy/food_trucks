class AddUserRefToFoodTrucks < ActiveRecord::Migration
  def change
    add_reference :food_trucks, :user, index: true
  end
end
