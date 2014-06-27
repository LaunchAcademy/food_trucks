class AddAdminToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :role, :string, null: false, default: 'member'
  end

  def self.down
    remove_column :users, :role
  end
end
