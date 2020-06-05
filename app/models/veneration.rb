class Veneration < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  enum score: [
    :unacceptable,
    :needs_improvement,
    :acceptable,
    :meets_expectations,
    :exceeds_expectations,
  ]
  validates :image, presence: true,
                    attached: true,
                    content_type: ["image/gif"],
                    size: { less_than: 5.megabytes, message: "is too large for attaching to Github issues." }
  validates :score, presence: true
  validates :caption, presence: true
  paginates_per 20
end
