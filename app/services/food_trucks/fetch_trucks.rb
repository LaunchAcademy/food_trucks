require 'streetfoodr'

class FoodTrucks::FetchTrucks

  def self.call
    self.new.import
  end

  def import
    food_trucks.each do |food_truck|
      import_food_truck(food_truck)
    end
  end

  def import_food_truck(attributes = {})
    api_identifier = attributes['identifier']

    FoodTruck.find_or_initialize_by(api_identifier: api_identifier).tap do |truck|
      truck.user = User.first
      truck.category = 'Unknown'
      truck.description = attributes['description']
      truck.name = attributes['name']

      truck.save
    end
  end

  def food_trucks
    Streetfoodr::FoodTruck.get_city_trucks('boston')['vendors'].map do |truck|
      truck[1]
    end
  end
end
