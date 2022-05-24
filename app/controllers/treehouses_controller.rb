class TreehousesController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @treehouses = Treehouse.all
  end

  def show
    @treehouse = Treehouse.find(params[:id])
  end

  def new
    @treehouse = Treehouse.new
  end

  def create
    treehouse = Treehouse.new(params[:treehouse])
    treehouse.user = current_user
    treehouse.save
  end

  private

  def treehouse_params
    params.require(:treehouse).permit(:address, :price_per_night, :description, :name)
  end
end
