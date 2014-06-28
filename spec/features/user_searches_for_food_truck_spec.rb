require 'rails_helper'

feature 'Login and Signup', %Q(
  As a site visitor
  I want to search for food trucks
  so I can find the one I want
) do

  scenario 'user searches for food truck' do
    food_truck1 = FactoryGirl.create(:food_truck)
    food_truck2 = FactoryGirl.create(:food_truck)

    visit food_trucks_path

    fill_in 'Search Users', with: food_truck1.name
    click_on 'Search'

    expect(page).to have_content food_truck1.name
    expect(page).to_not have_content food_truck2.name
  end
end
