# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string :full_name, default: "Unknown", null: true
      t.bigint :cid, default: 0, null: true
      t.string :present_address, default: "", null: true
      t.bigint :phonenumber, default: 0, null: true
      t.string :facility_name, default: "No name", null: true
      t.integer :is_blocked, default: 0, null: false
      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      ## Rememberable
      t.datetime :remember_created_at
      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true

  end
end
