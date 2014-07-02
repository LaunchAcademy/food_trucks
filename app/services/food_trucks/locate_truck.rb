class FoodTrucks::LocateTruck

  def self.call(food_truck_id)
    food_truck = FoodTruck.find(food_truck_id)
    response = RestClient.get("http://data.streetfoodapp.com/1.1/locations/boston/#{food_truck.api_identifier}")
    location_data = JSON.parse response

    location_data.to_a.each do |location_info|
      location = Location.find_or_create_by(
        name: location_info['display'],
        latitude: location_info['latitude'],
        longitude: location_info['longitude']
      )

      stop = Stop.find_or_create_by(food_truck: food_truck,
        time_arrive: location_info['last'], location: location)
    end
   end
end
