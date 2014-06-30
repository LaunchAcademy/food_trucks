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
          description: food_truck_info[1]['description'],user_id: 1)
      end
    end
  end

  def location
    #two options for restructuring our DB to make API calls work well - need to either
    #add optional column to trucks for 'identifier', so we can fill in this API call
    #correctly, since data structure makes it impossible to call just using name
    #or can just store schedule somehow associated to truck when we make the first
    #API call from populate, either way
    response = HTTParty.get("http://data.streetfoodapp.com/1.1/locations/boston/#{identifier}")
    binding.pry
  end
end
