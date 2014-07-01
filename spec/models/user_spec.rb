require 'rails_helper'

RSpec.describe FoodTruck, type: :model do
  describe '.search' do
    it 'returns reviews that match search' do
      pizza_truck  = FactoryGirl.create(:food_truck, name: "Pizza Truck")
      taco_truck  = FactoryGirl.create(:food_truck, name: "Taco Truck")

      expect(FoodTruck.search('Pizza')).to include pizza_truck
      expect(FoodTruck.search('Pizza')).to_not include taco_truck
    end

    it 'searches aren\'t case sensitive' do
      pizza_truck  = FactoryGirl.create(:food_truck, name: "Pizza Truck")
      taco_truck  = FactoryGirl.create(:food_truck, name: "Taco Truck")

      expect(FoodTruck.search('piZzA')).to include pizza_truck
      expect(FoodTruck.search('piZzA')).to_not include taco_truck
    end
  end
end
