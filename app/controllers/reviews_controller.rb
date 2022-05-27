class ReviewsController < ApplicationController

  def index
    @reviews = policy_scope(Review)
    @reviews_form = Review.new
    @treehouse = Treehouse.find(params[:treehouse_id])
  end

  def create
    @review = Review.new(review_params)
    @treehouse = Treehouse.find(params[:treehouse_id])
    @review.treehouse = @treehouse
    authorize @review
    if @review.save
      redirect_to treehouse_reviews_path(@treehouse)
    else
      render 'reviews/index', status: :unprocessable_entity
    end
  end

  def destroy
  end

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
