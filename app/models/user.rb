class User < ApplicationRecord
  belongs_to :account
  has_secure_password
  validates :username, presence: true, uniqueness: true
end
