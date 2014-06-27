class FoodTrucksController < ApplicationController
  def index
    @food_trucks = FoodTruck.order(:created_at).page(params[:page])
  end

  def show
    @food_truck = FoodTruck.find(params[:id])
    @review = Review.new
  end

  def destroy
    @food_truck = FoodTruck.find(params[:id])
    if @food_truck.destroy
      flash[:notice] = 'Truck deleted!'
      redirect_to food_trucks_path
    end
  end
end
