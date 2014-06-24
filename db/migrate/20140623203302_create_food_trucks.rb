class CreateFoodTrucks < ActiveRecord::Migration
  def change
    create_table :food_trucks do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :category, null: false

      t.timestamps
    end
  end
end

