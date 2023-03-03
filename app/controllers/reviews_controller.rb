class ReviewsController < ApplicationController
  before_action :set_house, only: %i[new create]
  def new
    @house = House.find(params[:house_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.house = @house
    if @review.save
      redirect_to house_path(@house)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to house_path(@review.house), status: :see_other
  end

  private

  def set_house
    @house = House.find(params[:house_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
