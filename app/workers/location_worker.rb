class LocationWorker
  include Sidekiq::Worker

  def perform(food_truck_id)
    FoodTrucks::LocateTruck.call(food_truck_id)
  end
end
