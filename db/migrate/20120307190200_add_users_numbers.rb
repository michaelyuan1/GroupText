class AddUsersNumbers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.string :encrypted_password
      t.string :salt
      t.timestamps
    end
    
    create_table :phonenumbers do |t|
      t.string :number
      t.integer :user_id
      t.timestamps
    end
    
  end

  def self.down
    drop_table :users
    drop_table :phonenumbers
  end
  
end
