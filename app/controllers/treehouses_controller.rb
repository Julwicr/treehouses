class TreehousesController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @treehouses = policy_scope(Treehouse)
  end

  def show
    @treehouse = Treehouse.find(params[:id])
    authorize @treehouse
  end

  def new
    @treehouse = Treehouse.new
    authorize @treehouse
  end

  def create
    treehouse = Treehouse.new(params[:treehouse])
    treehouse.user = current_user
    treehouse.save
    authorize @treehouse
  end

  private

  def treehouse_params
    params.require(:treehouse).permit(:address, :price_per_night, :description, :name, :photo)
  end
end
