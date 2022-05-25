class TreehousesController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @treehouses = policy_scope(Treehouse)
  end

  def show
    @treehouse = Treehouse.find(params[:id])
    @booking = Booking.new
    authorize @treehouse
  end

  def new
    @treehouse = Treehouse.new
    authorize @treehouse
  end

  def create
    @treehouse = Treehouse.new(treehouse_params)
    @treehouse.user = current_user
    if @treehouse.save
      redirect_to treehouses_path
    else
      render new_treehouse_path, status: :unprocessable_entity
    end
    authorize @treehouse
  end

  private

  def treehouse_params
    params.require(:treehouse).permit(:address, :price_per_night, :description, :name, :photo)
  end
end
