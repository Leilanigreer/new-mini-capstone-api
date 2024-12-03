class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  has_many :orders

  enum :role, { shopper: 0, admin: 1 }
end
