class TreehousesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @treehouses = policy_scope(Treehouse)
    @treehousesmap = Treehouse.all
    @markers = @treehousesmap.geocoded.map do |treehouse|
        {
          lat: treehouse.latitude,
          lng: treehouse.longitude,
          info_window: render_to_string(partial: "info_window", locals: {treehouse: treehouse}),
          image_url: helpers.asset_url("/assets/mapin.png")
        }
      end
    if params[:query].present?
      @search_treehouses = Treehouse.where("address ILIKE ?", "%#{params[:query]}%")
    else
      @search_treehouses = Treehouse.all
    end
  end

  def show
    @treehouse = Treehouse.find(params[:id])
    @booking = Booking.new
    @review = Review.new
    @reviews = @treehouse.reviews
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
      redirect_to treehouse_path(@treehouse)
    else
      render new_treehouse_path, status: :unprocessable_entity
    end
    authorize @treehouse
  end

  def edit
    @treehouse = Treehouse.find(params[:id])
    # checking if the user has the rights to edit the treehouse
    unless @treehouse.user == current_user
      redirect_to new_treehouse_path
    end
    authorize @treehouse
  end

  def update
    @treehouse = Treehouse.find(params[:id])
    if @treehouse.update(treehouse_params)
      redirect_to @treehouse
    else
      render :edit, status: :unprocessable_entity
    end
    authorize @treehouse
  end

  def destroy
    @treehouse = Treehouse.destroy(params[:id])
    redirect_to new_treehouse_path, :notice => "treehouse '#{@treehouse.name}' was deleted."
    authorize @treehouse
  end

  private

  def treehouse_params
    params.require(:treehouse).permit(:address, :price_per_night, :description, :name, :photo)
  end
end
