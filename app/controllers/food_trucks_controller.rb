class FoodTrucksController < ApplicationController
  def index
    @food_trucks = FoodTruck.order(created_at: :desc).page(params[:page])
  end

  def show
    @food_truck = FoodTruck.find(params[:id])
    @review = Review.new
  end

  def create
    @food_truck = FoodTruck.new(food_truck_params)
    @food_truck.user = current_user

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

  def edit
    @food_truck = FoodTruck.find(params[:id])
  end

  def update
    @food_truck = FoodTruck.find(params[:id])
    if @food_truck.update(food_truck_params)
      redirect_to(@food_truck)
    else
      flash.now[:notice] = "Uh oh! Your Food Truck could not be updated."
      render :edit
    end
  end

  def destroy
    @food_truck = FoodTruck.find(params[:id])
    if @food_truck.destroy
      flash[:notice] = "Your Food Truck was deleted"
      redirect_to '/'
    else
      flash.now[:notice] = "Uh oh! Your Food Truck could not be deleted."
    end
  end

  private

  def food_truck_params
    params.require(:food_truck).permit(:name, :category, :description)
  end

end
