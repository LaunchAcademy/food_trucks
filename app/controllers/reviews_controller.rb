class ReviewsController < ApplicationController
  def create
    @food_truck = FoodTruck.find(params[:food_truck_id])
    @review = Review.new(review_params)

    @review.food_truck = @food_truck

    if @review.save
      flash.now[:notice] = 'Your review was saved!'
      binding.pry
      redirect_to food_truck_path(@food_truck)
    else
      flash.now[:notice] = 'Your review could not be saved'
      render food_truck_path(@food_truck)
    end
  end

  def destroy
  end

  def update
  end

  private

  def review_params
    params.require(:review).permit(:rating, :body)
  end

end
