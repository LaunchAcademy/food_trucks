class FoodTrucksController < ApplicationController
  def index
    @food_truck = FoodTruck.all
  end

  def show
    @food_truck = FoodTruck.find(params[:id])
  end
end
