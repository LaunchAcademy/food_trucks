class Trucks::LocateTruck

  def self.call(food_truck_api_identifier, food_truck_id)
     response = RestClient.get("http://data.streetfoodapp.com/1.1/locations/boston/#{food_truck_api_identifier}")
     location_data = JSON.parse response
     location_data.to_a.each do |location_info|
       place = Location.create(name: location_info['display'],
         latitude: location_info['latitude'], longitude: location_info['longitude'])
       Stop.create(location_id: place.id, food_truck_id: food_truck_id,
         time_arrive: location_info['last'].to_f)
     end
   end
end
