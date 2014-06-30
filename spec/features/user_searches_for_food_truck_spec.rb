require 'rails_helper'

feature 'Login and Signup', %Q(
  As a site visitor
  I want to search for food trucks
  so I can find the one I want
) do

  scenario 'user searches for food truck' do
    pizza_truck  = FactoryGirl.create(:food_truck, name: "Pizza Truck")
    taco_truck  = FactoryGirl.create(:food_truck, name: "Taco Truck")

    visit food_trucks_path

    fill_in 'Search Trucks', with: pizza_truck.name
    click_on 'Search'

    expect(page).to have_content pizza_truck.name
    expect(page).to_not have_content taco_truck.name
  end
end
