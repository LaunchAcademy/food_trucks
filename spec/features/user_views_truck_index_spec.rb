require 'rails_helper'

feature 'user views food truck index page', %Q{
  As a user
  I want to be able to see a page of food trucks (/foodtrucks)
  So that I can choose one and see its information and reviews
} do

  scenario 'user can view food trucks' do
    trucks = []

    truck1 = FoodTruck.create!(name: 'Stoked')
    trucks << truck1

    truck2 = FoodTruck.create!(name: 'Meng\'s Kitchen')
    trucks << truck2

    truck3 = FoodTruck.create!(name: 'Chicken and Rice Guys')
    trucks << truck3

    visit '/food_trucks'

    trucks.each do |truck|
      expect(page).to have_content truck.name
    end
  end
end
