class FoodTruck < ActiveRecord::Base
  validates :name, :description, :category, presence: true
  validates :description, length: { minimum: 50 }
  validates :user, presence: true

  has_many :reviews
  belongs_to :user

  def self.populate
    response = HTTParty.get('http://data.streetfoodapp.com/1.1/schedule/boston/')
    food_truck_data = JSON.parse response.gsub('=>', ':')
    parsable_food_truck_data = food_truck_data['vendors'].sort
    parsable_food_truck_data.each do |food_truck_info|
      unless FoodTruck.find_by(name: food_truck_info[1]['name'])
        truck = FoodTruck.create(name: food_truck_info[1]['name'],category: 'Unknown',
          description: food_truck_info[1]['description'],user_id: 1,
          api_identifier: food_truck_info[1]['identifier'])
      end
    end
  end

  def location
    response = HTTParty.get("http://data.streetfoodapp.com/1.1/locations/boston/#{api_identifier}")
    location_data = JSON.parse response
    display = []
    location_data.each do |location_info|
      display << { location: location_info['display'], start_time: Time.at(location_info['last'].to_f) }
    end
    display
  end
end
