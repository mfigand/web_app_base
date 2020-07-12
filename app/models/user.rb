class User < ApplicationRecord
  has_secure_password
  default_scope -> { where(deleted_at: nil) }

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

  def soft_delete
    update(deleted_at: Time.now.utc)
  end
end
