class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    # find out the restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
    # create a new review
    @review = Review.new(review_params)
    # pass the restaurant id to the restaurant_id
    @review.restaurant_id = @restaurant.id # also can be done like this  @review.restaurant = @restaurant
    # save
    if @review.save
      # after create a review, give the user a feedback
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
