class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :treehouse

  validates :number_of_guests, :check_in, :check_out, presence: true
  enum status: %i[approved pending rejected], _default: "pending"
end
