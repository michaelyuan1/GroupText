class AddGroupnameAndnumbers < ActiveRecord::Migration
  def self.up
    add_column :numbergroups, :name, :string
  end

  def self.down
    remove_column :numbergroups, :name
    remove_column :phonenumbers, :number
  end
end
