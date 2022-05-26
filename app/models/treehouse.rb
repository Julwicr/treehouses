class Treehouse < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_address,
                  against: [:address],
                  using: {
                    tsearch: { prefix: true }
                  }
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo

  validates :name, :address, :description, presence: true
end
