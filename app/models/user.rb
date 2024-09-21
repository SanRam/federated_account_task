class User < ApplicationRecord
  belongs_to :account
  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 5 }
end
