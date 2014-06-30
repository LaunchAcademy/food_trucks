class LocationsWorker
  include Sidekiq::Worker

  def perform(food_truck_api_identifier)
    response = RestClient.get("http://data.streetfoodapp.com/1.1/locations/boston/#{food_truck_api_identifier}")
    location_data = JSON.parse response
    display = []
    location_data.to_a.each do |location_info|
      display << { location: location_info['display'], start_time: Time.at(location_info['last'].to_f) }
    end
  end
end
