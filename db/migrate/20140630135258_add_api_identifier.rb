class AddApiIdentifier < ActiveRecord::Migration
  def self.up
    add_column :food_trucks, :api_identifier, :string
  end

  def self.down
    remove_column :food_trucks, :api_identifier
  end
end
