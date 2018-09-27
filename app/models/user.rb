class User < ApplicationRecord
  has_many :venerations
  validates :email, presence: true, uniqueness: true

  def self.from_auth_hash(auth)
    user = where(uid: auth.uid).first_or_initialize.tap do |user|
      user.name = auth.info.name
      user.email = auth.info.email
      user.save!
    end
  end
end
