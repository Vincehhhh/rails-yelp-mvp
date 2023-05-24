class ReviewsController < ApplicationController
  before_action :find_restaurant, only: %i[new create]

  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def new

    @review = Review.new
  end

  def create
    # raise
    @review = Review.new(review_params)
    @review.save
    redirect_to restaurant_path(@restaurant)

  end

  private

  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end

end
