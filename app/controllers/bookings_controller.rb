class BookingsController < ApplicationController

  def create
    @booking = Booking.new(booking_params)
    @treehouse = Treehouse.find(params[:treehouse_id])
    @booking.user = current_user
    @booking.treehouse = @treehouse
    authorize @booking
    if @booking.save
      redirect_to dashboards_path
    else
      render "treehouses/show", status: :unprocessable_entity
    end
    authorize @treehouse
  end

  private

  def booking_params
    params.require(:booking).permit(:check_in, :check_out, :number_of_guests)
  end
end
