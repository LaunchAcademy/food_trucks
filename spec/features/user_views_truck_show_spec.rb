require 'rails_helper'

feature 'user views food truck show page', %Q{
  As a user
  I want to be able to select a food truck from the index page
  So that I can see its information and reviews (/foodtrucks/:foodtruck_id)
} do

  scenario 'user can see a food truck basic info' do
    truck = FactoryGirl.create(:food_truck)

    visit food_truck_path(truck)

    expect(page).to have_content truck.name
    expect(page).to have_content truck.description
    expect(page).to have_content truck.category
  end

  scenario 'user can see food truck reviews' do

    truck = FactoryGirl.create(:food_truck)
    test_user = FactoryGirl.create(:user)
    review = FactoryGirl.create(:review, user: test_user, food_truck: truck)

    visit food_truck_path(truck)

    expect(page).to have_content review.rating
    expect(page).to have_content review.body
  end
end
