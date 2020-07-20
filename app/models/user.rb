# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  default_scope -> { where(deleted_at: nil) }

  has_many :users_roles, dependent: :destroy
  has_many :roles, through: :users_roles

  validates :name, :lastname, length: { maximum: 250 }
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true,
                       format: { with: /\A[a-zA-ZÑñ0-9\ ]+\z/ },
                       length: { minimum: 8 },
                       if: :password
  # validates_each :password do |record, attr, value|
  #   record.errors.add(attr, 'must start with upper case') if value =~ /\A[[:lower:]]/
  #   end
  # /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])\w{8,}$/

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
