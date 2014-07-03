class Locations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name, null: false
      t.float :latitude, null: false
      t.float :longitude, null: false
    end
  end
end
