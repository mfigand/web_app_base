# frozen_string_literal: true

class UsersRole < ApplicationRecord
  belongs_to :user
  belongs_to :role

  validates :user_id, uniqueness: { scope: %i[user_id role_id] }
end
