API_URL = 'http://data.streetfoodapp.com/1.1/schedule/boston/'

class Trucks::FetchTrucks

  def self.call()

    def import_food_truck(attributes)
      FoodTruck.find_or_initialize_by(name: food_truck_info[1]['name']).tap do |truck|
        truck.user_id = 1
        truck.category = 'Unknown'
        truck.description = food_truck_info[1]['description']
        truck.api_identifier = food_truck_info[1]['identifier']

        truck.save
      end
    end

    def import
      food_trucks.each do |food_truck|
        import_food_truck(food_truck)
      end
    end

    def food_trucks
      food_truck_data['vendors'].sort
    end

    private

    def food_truck_data
      response = RestClient.get(API_URL)
      JSON.parse(response)
    end
  end
end
