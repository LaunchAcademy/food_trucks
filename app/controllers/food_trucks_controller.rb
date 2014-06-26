class FoodTrucksController < ApplicationController
  def index
    @food_trucks = FoodTruck.order(created_at: :desc ).page(params[:page])
  end

  def show
    @food_truck = FoodTruck.find(params[:id])
    @review = Review.new
  end

  def create
    @food_truck = FoodTruck.new(food_truck_params)
    if @food_truck.save
      redirect_to '/food_trucks'
    else
      flash.now[:notice] = "Uh oh! Your food truck could not be saved."
      render :new
    end
  end

  def new
    if !user_signed_in?
      flash[:notice] = "You must be signed in to do that."
      redirect_to '/food_trucks'
    else
      @food_truck = FoodTruck.new
    end
  end

  def destroy

  end

  private

  def food_truck_params
    params.require(:food_truck).permit(:name, :category, :description)
  end


end
