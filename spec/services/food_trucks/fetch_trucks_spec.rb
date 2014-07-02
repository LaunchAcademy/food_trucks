require 'rails_helper'

describe FoodTrucks::FetchTrucks do
  describe "#import" do
    it "imports each food truck returned by api" do
      fetch_trucks = FoodTrucks::FetchTrucks.new

      allow(fetch_trucks).to receive(:food_trucks) { [1, 2, 3, 4, 5] }
      expect(fetch_trucks).to receive(:import_food_truck).exactly(5).times

      fetch_trucks.import
    end
  end

  describe "#import_food_truck" do
    it "creates a new food truck if it doesn't already exist" do
      FactoryGirl.create(:user)
      fetch_trucks = FoodTrucks::FetchTrucks.new

      expect {
        fetch_trucks.import_food_truck(fake_food_truck_response)
      }.to change(FoodTruck, :count).by(1)
    end

    it "updates a food truck if it already exists" do
      FactoryGirl.create(:user)
      food_truck = FactoryGirl.create(:food_truck)
      fetch_trucks = FoodTrucks::FetchTrucks.new
      fake_response = fake_food_truck_response(food_truck.api_identifier)

      expect {
        fetch_trucks.import_food_truck(fake_response)
        fetch_trucks.import_food_truck(fake_response)
        fetch_trucks.import_food_truck(fake_response)
        fetch_trucks.import_food_truck(fake_response)
        fetch_trucks.import_food_truck(fake_response)
      }.to change(FoodTruck, :count).by(0)
    end
  end
end

def fake_food_truck_response(name="Taco Party")
  {
    "identifier" => "taco-party",
    "name" => name,
    "description" => "A food truck serving vegetarian tacos. You can eat here.",
    "rating" => 152,
    "url" => "tacopartytruck.com",
    "phone" => "(617) 905-5829",
    "email" => "keith@tacopartytruck.com",
    "twitter" => "tacopartytruck"
  }
end
