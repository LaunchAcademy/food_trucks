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

    truck = FoodTruck.new(attrs)
    truck.save

  scenario 'user can see a food truck basic info' do

    visit "/food_trucks/#{truck.id}"

    expect(page).to have_content truck.name
    expect(page).to have_content truck.description
    expect(page).to have_content truck.category
  end

  scenario 'user can see food truck reviews' do
    review_attrs = {
      rating: 3
      body: "This is at least a fifty-character review of a food truck."
      food_truck_id: truck.id
    }

    review = Review.new(review_attrs)
    review.save

    visit "/food_trucks/#{truck.id}"

    expect(page).to have_content truck.review.rating
    expect(page).to have_content truck.review.body
  end
end
