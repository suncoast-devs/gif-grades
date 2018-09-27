class User < ApplicationRecord
  has_many :venerations
  has_secure_password
  validates :email, presence: true, uniqueness: true
end
