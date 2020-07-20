# frozen_string_literal: true

class CreateUsersRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :users_roles do |t|
      t.integer :user_id, null: false, index: true
      t.integer :role_id, null: false, index: true

      t.timestamps
    end

    add_index :users_roles, %i[user_id role_id], unique: true
    add_index :users_roles, :created_at
    add_index :users_roles, :updated_at
  end
end
