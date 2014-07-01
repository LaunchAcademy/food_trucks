class AddApiIdentifier < ActiveRecord::Migration
  def change
    add_column :food_trucks, :api_identifier, :string
    add_index :food_trucks, :api_identifier, unique: true
  end
end
