class FoodTrucksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    FoodTrucksWorker.perform_async()
    @food_trucks = FoodTruck.order(created_at: :desc).page(params[:page])
  end

  def show
    @food_truck = FoodTruck.find(params[:id])
    @locations = LocationsWorker.perform_async(@food_truck.api_identifier, @food_truck.id)
    @review = Review.new
  end

  def create
    @food_truck = current_user.food_trucks.build(food_truck_params)

    if @food_truck.save
      redirect_to food_trucks_path
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
    verify_authorized!(@food_truck)
  end

  def update
    @food_truck = FoodTruck.find(params[:id])
    verify_authorized!(@food_truck)
    if @food_truck.update(food_truck_params)
      redirect_to(@food_truck)
    else
      flash.now[:notice] = 'Uh oh! Your Food Truck could not be updated.'
      render :edit
    end
  end

  def destroy
    if current_user.admin?
      @food_truck = FoodTruck.find(params[:id])
      if @food_truck.destroy
        flash[:notice] = 'Truck deleted!'
        redirect_to food_trucks_path
      end
    end
  end

  private

  def verify_authorized!(food_truck)
    if current_user != food_truck.user
      flash[:notice] = 'You did not post this food truck.'
      redirect_to food_trucks_path
    end
  end

  def food_truck_params
    params.require(:food_truck).permit(:name, :category, :description)
  end
end
