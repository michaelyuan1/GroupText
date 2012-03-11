class InitiatTable < ActiveRecord::Migration
  def up
    create_table :phonenumbers do |t|
      t.string   "number"
      t.integer  "user_id"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table :users do |t|
      t.string   "name"
      t.string   "encrypted_password"
      t.string   "salt"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end

  def down
      drop_table :users
      drop_table :phonenumbers
  end
end
