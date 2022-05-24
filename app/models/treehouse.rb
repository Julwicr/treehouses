class Treehouse < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :name, :address, :description, presence: true
end
