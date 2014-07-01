class Trucks::FetchTrucks
   API_URL = 'http://data.streetfoodapp.com/1.1/schedule/boston/'

  def self.call
    self.new.import
  end

  def import
    food_trucks.each do |food_truck|
      import_food_truck(food_truck)
    end
  end

  def import_food_truck(attributes)
    name = attributes['name']

    FoodTruck.find_or_initialize_by(name: name).tap do |truck|
      truck.user = User.first
      truck.category = 'Unknown'
      truck.description = attributes['description']
      truck.api_identifier = attributes['identifier']

      truck.save
    end
  end

  def food_trucks
    food_truck_data['vendors'].sort.map do |truck|
      truck[1]
    end
  end

  private

  def food_truck_data
    response = RestClient.get(API_URL)
    JSON.parse(response)
  end
end
