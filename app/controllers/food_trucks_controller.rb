class FoodTrucksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @food_trucks = FoodTruck.order(created_at: :desc).page(params[:page])
  end

  def show
    @food_truck = FoodTruck.find(params[:id])
    @review = Review.new
  end

  def create
    @food_truck = current_user.food_trucks.build(food_truck_params)

    if @food_truck.save
      redirect_to '/food_trucks'
    else
      flash.now[:notice] = 'Uh oh! Your food truck could not be saved.'
      render :new
    end
  end

  def new
    @food_truck = FoodTruck.new
  end

  def edit
    @food_truck = FoodTruck.find(params[:id])
    current_user_posted?(@food_truck)
  end

  def update
    @food_truck = FoodTruck.find(params[:id])
    current_user_posted?(@food_truck)
    if @food_truck.update(food_truck_params)
      redirect_to(@food_truck)
    else
      flash.now[:notice] = 'Uh oh! Your Food Truck could not be updated.'
      render :edit
    end
  end

  def destroy
    @food_truck = FoodTruck.find(params[:id])
    current_user_posted?(@food_truck)
    if @food_truck.destroy
      flash[:notice] = 'Your Food Truck was deleted'
      redirect_to '/'
    else
      flash.now[:notice] = 'Uh oh! Your Food Truck could not be deleted.'
    end
  end

  private

  def current_user_posted?(food_truck)
    if current_user != food_truck.user
      flash[:notice] = 'You did not post this food truck.'
      redirect_to food_trucks_path
    end
  end

  def food_truck_params
    params.require(:food_truck).permit(:name, :category, :description)
  end
end
