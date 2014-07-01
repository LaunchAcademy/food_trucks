class LocationsWorker
  include Sidekiq::Worker

  def perform(food_truck_api_identifier, food_truck_id)
    Trucks::LocateTruck.call(food_truck_api_identifier, food_truck_id)
  end
end
