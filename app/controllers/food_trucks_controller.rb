class FoodTrucksController < ApplicationController
  def index
    binding.pry
    @food_trucks = FoodTruck.order(:created_at).page(params[:page])
  end

  def show
    @food_truck = FoodTruck.find(params[:id])
    @review = Review.new
  end
end
