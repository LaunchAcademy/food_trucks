class FoodTrucksWorker
  include Sidekiq::Worker

  def perform()
    response = RestClient.get('http://data.streetfoodapp.com/1.1/schedule/boston/')
    food_truck_data = JSON.parse(response)
    parsable_food_truck_data = food_truck_data['vendors'].sort
    parsable_food_truck_data.each do |food_truck_info|
      unless FoodTruck.find_by(name: food_truck_info[1]['name'])
        truck = FoodTruck.create(name: food_truck_info[1]['name'],category: 'Unknown',
          description: food_truck_info[1]['description'],user_id: 1,
          api_identifier: food_truck_info[1]['identifier'], twitter: '@' +
          food_truck_info[1]['twitter'])
      end
    end
  end
end
