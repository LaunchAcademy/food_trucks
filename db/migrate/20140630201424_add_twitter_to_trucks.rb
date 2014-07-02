class AddTwitterToTrucks < ActiveRecord::Migration
  def self.up
    add_column :food_trucks, :twitter, :string
  end

  def self.down
    remove_column :food_trucks, :twitter
  end
end
