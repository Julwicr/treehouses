class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :treehouse

  validates :number_of_guests, :check_in, :check_out, presence: true
  validates :number_of_guests, :inclusion => 1..10
end
