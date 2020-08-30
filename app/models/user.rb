# frozen_string_literal: true

class User < ApplicationRecord
  PASSWORD_REQUIREMENTS = /\A(?=.{8,32}$)(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[0-9])(?=.*?\W).*\z/
  PASSWORD_REQUIREMENTS_MSG = 'must be between 8-32 characters, have at least 1 lowercase letter, 1 uppercase letter, 1 number and 1 special character'

  has_secure_password
  default_scope -> { where(deleted_at: nil) }

  has_many :users_roles, dependent: :destroy
  has_many :roles, through: :users_roles

  validates :name, :lastname, length: { maximum: 250 }
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true,
                       format: { with: PASSWORD_REQUIREMENTS,
                                 message: PASSWORD_REQUIREMENTS_MSG },
                       if: :password

  def admin?
    roles&.pluck(:name)&.include?('admin')
  end

  def neighbour?
    roles&.pluck(:name)&.include?('neighbour')
  end

  def soft_delete
    update(deleted_at: Time.now.utc)
  end

  def superadmin?
    roles&.pluck(:name)&.include?('superadmin')
  end
end
