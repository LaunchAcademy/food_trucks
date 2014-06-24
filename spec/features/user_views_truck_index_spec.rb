require 'rails_helper'

feature 'user views food truck index page', %Q{
  As a user
  I want to be able to see a page of food trucks (/foodtrucks)
  So that I can choose one and see its information and reviews
} do

  scenario 'user can view food trucks' do
    attrs = {
      name: 'stokes',
      description: 'This is at least a fifty-character description of a food truck.',
      category: 'Pizza'
    }
    attrs1 = {
      name: 'stokes1',
      description: 'beeeps that like to boop while booping into the beeps making sure this is long enough',
      category: 'Pizza1'
    }

    truck1 = FoodTruck.create!(attrs)
    truck2 = FoodTruck.create!(attrs1)

    visit food_trucks_path

    expect(page).to have_content truck1.name
    expect(page).to have_content truck2.name
  end
end
