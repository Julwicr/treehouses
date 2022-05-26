class BookingsController < ApplicationController

  def show
    # can we just use current_user here ?
    @bookings = current_user.bookings.all
  end

  def create
    @booking = Booking.new(booking_params)
    @treehouse = Treehouse.find(params[:treehouse_id])
    @booking.user = current_user
    @booking.treehouse = @treehouse
    authorize @booking
    authorize @treehouse
    if @booking.save
      redirect_to dashboards_path
    else
      render 'treehouses/show', status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:check_in, :check_out, :number_of_guests)
  end
end
