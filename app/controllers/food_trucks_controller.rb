class FoodTrucksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @food_trucks = FoodTruck.order(cached_votes_score: :desc).page(params[:page])
    @vote = Vote.new
  end

  def show
    @food_truck = FoodTruck.find(params[:id])
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

  def upvote
    @food_truck = FoodTruck.find(params[:id])
    @food_truck.liked_by current_user
    # @vote = Vote.find_by(food_truck: @food_truck, user: current_user)
    # if @vote.nil?
    #   @vote = Vote.new(food_truck: @food_truck, user: current_user)
    # end
    # @vote.vote_flag = true
    # @vote.save
    redirect_to food_trucks_path
    # @food_truck.vote_by voter: current_user
  end

  def downvote
    @food_truck = FoodTruck.find(params[:id])
    @food_truck.downvote_from current_user
    # @vote = Vote.find_by(food_truck: @food_truck, user: current_user)
    # if @vote.nil?
    #   @vote = Vote.new(food_truck: @food_truck, user: current_user)
    # end
    # @vote.vote_flag = true
    # @vote.save
    redirect_to food_trucks_path
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
