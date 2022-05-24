class BookingsController < ApplicationController

  def show
    # can we just use current_user here ?
    @bookings = current_user.bookings.all
  end

  def create
    booking = Booking.new(params[:booking])
    booking.user = current_user
    #bokking.treehouse_id = treehouse_id
    booking.save
  end
end
