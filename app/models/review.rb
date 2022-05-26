class Review < ApplicationRecord
  belongs_to :treehouse

  validates :comment, :rating, presence: true
end
