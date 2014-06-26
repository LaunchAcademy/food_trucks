require 'rails_helper'

feature 'user views food truck index page', %Q{
  As a user
  I want to be able to see a page of food trucks (/foodtrucks)
  So that I can choose one and see its information and reviews
} do

  scenario 'user can view food trucks' do
    truck1 = FactoryGirl.create(:food_truck)
    truck2 = FactoryGirl.create(:food_truck)

    visit food_trucks_path

    expect(page).to have_content truck1.name
    expect(page).to have_content truck2.name
  end
end
