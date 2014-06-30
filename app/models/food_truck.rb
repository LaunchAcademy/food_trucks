class FoodTruck < ActiveRecord::Base
  validates :name, :description, :category, presence: true
  validates :description, length: { minimum: 50 }
  validates :user, presence: true

  has_many :reviews
  belongs_to :user

  def self.populate
    response = RestClient.get('http://data.streetfoodapp.com/1.1/schedule/boston/')
    food_truck_data = JSON.parse(response)
    parsable_food_truck_data = food_truck_data['vendors'].sort
    parsable_food_truck_data.each do |food_truck_info|
      unless FoodTruck.find_by(name: food_truck_info[1]['name'])
        truck = FoodTruck.create(name: food_truck_info[1]['name'],category: 'Unknown',
          description: food_truck_info[1]['description'],user_id: 1,
          api_identifier: food_truck_info[1]['identifier'])
      end
    end
  end
end
