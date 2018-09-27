class Veneration < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :score, presence: true
end
