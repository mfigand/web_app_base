# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name, index: true
      t.string :lastname, index: true
      t.string :email, null: false, unique: true, index: true
      t.string :password_digest, null: false, index: true
      t.datetime :deleted_at, index: true

      t.timestamps
    end

    add_index :users, :created_at
    add_index :users, :updated_at
  end
end
