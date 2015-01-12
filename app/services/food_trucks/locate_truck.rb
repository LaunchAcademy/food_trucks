require 'streetfoodr'

class FoodTrucks::LocateTruck

  def self.call(food_truck_id)
    food_truck_identifier = FoodTruck.find(food_truck_id).api_identifier
    streetfooder_truck = Streetfoodr::FoodTruck.new(food_truck_identifier, "boston")

    streetfooder_truck.locations.to_a.each do |location_info|
      location = Location.find_or_create_by(
        name: location_info['display'],
        latitude: location_info['latitude'],
        longitude: location_info['longitude']
      )

      stop = Stop.find_or_create_by(food_truck: food_truck,
        time_arrive: DateTime.parse(Time.at(location_info['last']).to_s), location: location)
    end
   end
end
