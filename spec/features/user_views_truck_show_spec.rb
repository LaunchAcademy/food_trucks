require 'rails_helper'

feature 'user views food truck show page', %Q{
  As a user
  I want to be able to select a food truck from the index page
  So that I can see its information and reviews (/foodtrucks/:foodtruck_id)
} do

    attrs = {
      name: 'stokes',
      description: 'fire roasted pizza',
      category: 'Pizza'
     }

  scenario 'user can see a food truck' do
    truck = FoodTruck.new(attrs)
    truck.save

    visit "/food_trucks/#{truck.id}"

    expect(page).to have_content truck.name
    expect(page).to have_content truck.description
    expect(page).to have_content truck.category
  end

  # TODO user should see reviews for food truck as well
end

