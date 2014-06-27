require 'rails_helper'

feature 'user views food truck show page', %Q{
  As a user
  I want to be able to select a food truck from the index page
  So that I can see its information and reviews (/foodtrucks/:foodtruck_id)
} do

  scenario 'user can see a food truck basic info' do
    review = FactoryGirl.create(:review)

    visit food_truck_path(review.food_truck)

    expect(page).to have_content truck.name
    expect(page).to have_content truck.description
    expect(page).to have_content truck.category
  end

  scenario 'user can see food truck reviews' do

    test_user = FactoryGirl.create(:user)
    review = FactoryGirl.create(:review, user: test_user)

    visit food_truck_path(review.food_truck)

    expect(page).to have_content review.rating
    expect(page).to have_content review.body
  end
end
