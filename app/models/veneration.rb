class Veneration < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  enum score: [
    :unacceptable,
    :needs_improvement,
    :acceptable,
    :meets_expectations,
    :exceeds_expectations
  ]
  validates :image, presence: true
  validates :score, presence: true
  validates :caption, presence: true
  paginates_per 1
end
