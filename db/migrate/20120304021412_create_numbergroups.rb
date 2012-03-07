class CreateNumbergroups < ActiveRecord::Migration
  def self.up
    create_table :numbergroups do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :numbergroups
  end
end
