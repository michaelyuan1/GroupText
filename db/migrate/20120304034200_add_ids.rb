class AddIds < ActiveRecord::Migration
  def self.up
    add_column :numbergroups, :user_id, :integer
    add_column :phonenumbers, :numbergroup_id, :integer
  end

  def self.down
  end
end
