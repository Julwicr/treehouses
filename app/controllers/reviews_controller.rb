class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @treehouse = Treehouse.find(params[:treehouse_id])
    @review.treehouse = @treehouse
    authorize @review
    if @review.save
      redirect_to @treehouse
    else
      render 'treehouses/index', status: :unprocessable_entity
    end
  end

  def destroy
  end

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
