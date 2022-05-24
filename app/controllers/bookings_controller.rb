class BookingsController < ApplicationController

  def show
    # can we just use current_user here ?
    @bookings = current_user.bookings.all
  end

  def create
  end
end
