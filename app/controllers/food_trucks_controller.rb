class FoodTrucksController < ApplicationController
  def index
    @food_trucks = FoodTruck.all
  end

  def show
    @food_truck = FoodTruck.find(params[:id])
    @review = Review.new
  end
end
