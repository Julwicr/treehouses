class DashboardsController < ApplicationController
  def index
    @bookings = policy_scope(Booking)
    @user_bookings = Booking.all.where(user_id: current_user)
    @user_treehouses = Treehouse.all
    @all_booked_treehouses = Booking.all
  end

  def reject_status
    @booking = Booking.find(params[:id])
    @booking.rejected!
    redirect_to dashboards_path
    authorize @booking
  end

  def approve_status
    @booking = Booking.find(params[:id])
    @booking.approved!
    redirect_to dashboards_path
    authorize @booking
  end
end
