class DashboardsController < ApplicationController
  def index
    @bookings = policy_scope(Booking)
    @user_bookings = Booking.all.where(user_id: current_user)
    @user_treehouses = Treehouse.all
    @all_booked_treehouses = Booking.all
  end
end
