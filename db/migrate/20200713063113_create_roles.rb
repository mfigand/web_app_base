# frozen_string_literal: true

class CreateRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :roles do |t|
      t.integer :name, null: false, index: true
      t.integer :resource, index: true
      t.integer :resource_id, index: true

      t.timestamps
    end

    add_index :roles, :created_at
    add_index :roles, :updated_at
  end
end
