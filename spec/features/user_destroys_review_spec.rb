require 'rails_helper'

feature 'user destroys a review', %Q{
  As a user (eventually admin)
  I want to remove a review from the site
  So that inappropriate reviews do not stay on the site
} do

  scenario 'user deletes a review' do
    user = FactoryGirl.create(:user)

    sign_in_as(user)

    truck = FactoryGirl.create(:food_truck)
    review = FactoryGirl.create(:review)

    visit food_truck_path(truck)
    click_on 'Delete review'

    expect(page).to have_content('Review deleted!')
    expect(page).to_not have_content(review.rating)
    expect(page).to_not have_content(review.body)
  end
end
