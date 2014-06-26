class ReviewsController < ApplicationController
  def create
    @food_truck = FoodTruck.find(params[:food_truck_id])
    @review = @food_truck.reviews.build(review_params)
    @review.user = current_user
    if @review.save
      flash[:notice] = 'Your review was saved!'
      redirect_to food_truck_path(@food_truck)
    else
      @food_truck.reviews.delete(@review)
      flash[:notice] = 'Your review could not be saved'
      render 'food_trucks/show'
    end
  end

  def destroy
    @food_truck = FoodTruck.find(params[:food_truck_id])
    @review = Review.find(params[:id])
    if @review.destroy
      flash[:notice] = 'Review deleted!'
      redirect_to food_truck_path(@food_truck)
    else
      flash[:notice] = 'Oops! Something went wrong.'
      render 'food_trucks/show'
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @food_truck = FoodTruck.find(params[:food_truck_id])
    @review = Review.find(params[:id])
    if @review.update(review_params)
      flash[:notice] = 'Changes saved!'
      redirect_to food_truck_path(@food_truck)
    else
      render 'food_trucks/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :body)
  end
end
