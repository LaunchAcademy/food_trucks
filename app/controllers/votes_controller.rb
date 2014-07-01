class VotesController < ApplicationController
# #   def food_truck_up
# #     @food_truck = FoodTruck.find(params[:food_truck_id])
# #     @vote = Vote.find_by(food_truck: @food_truck, user: current_user)
# #     if @vote.nil?
# #       @vote = Vote.new(food_truck: @food_truck, user: current_user)
# #     end
# #     @vote.vote_flag = true
# #     @vote.save
# #     redirect_to food_trucks_path
# #     # @food_truck.vote_by voter: current_user
# #   end
# #
# #   def food_truck_down
# #     @food_truck = FoodTruck.find(params[:food_truck_id])
# #     @vote = Vote.find_by(food_truck: @food_truck, user: current_user)
# #     if @vote.nil?
# #       @vote = Vote.new(food_truck: @food_truck, user: current_user)
# #     end
# #     @vote.vote_flag = false
# #     @vote.save
# #     redirect_to food_trucks_path
# #   end
# #
# #   def review_up
# #     @review = Review.find(params[:food_truck_id])
# #     @vote = Vote.find_by(review: @review, user: current_user)
# #     if @vote.nil?
# #       @vote = Vote.new(review: @review, user: current_user)
# #     end
# #     @vote.vote_flag = true
# #     @vote.save
# #     redirect_to food_trucks_path
# #     # @food_truck.vote_by voter: current_user
# #   end
# #
# #   def review_down
# #     @review = Review.find(params[:food_truck_id])
# #     @vote = Vote.find_by(review: @review, user: current_user)
# #     if @vote.nil?
# #       @vote = Vote.new(review: @review, user: current_user)
# #     end
# #     @vote.vote_flag = false
# #     @vote.save
# #     redirect_to food_trucks_path
# #   end
end
