require 'rails_helper'

feature 'user destroys a review', %Q{
  As a user
  I want to remove a review from the site
  So that reviews of which I am no longer proud do not have to stay
} do

  scenario 'user deletes a review' do
    user = FactoryGirl.create(:user)
    sign_in_as(user)

    food_truck = FactoryGirl.create(:food_truck)
    review = FactoryGirl.create(:review, food_truck: food_truck)
    review2 = FactoryGirl.create(:review, food_truck: food_truck)

    visit food_truck_path(food_truck)
    click_on "delete-review-#{review.id}"

    expect(page).to have_content('Review deleted!')
    expect(page).to_not have_content(review.body)
    expect(page).to have_content(review2.body)
  end

  scenario 'user tries to delete a review which is not his/her own' do
    user = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)
    sign_in_as(user2)

    food_truck = FactoryGirl.create(:food_truck)
    review = FactoryGirl.create(:review, food_truck: food_truck, user: user)

    visit food_truck_path(food_truck)
    expect(page).to_not have_button("delete-review-#{review.id}")
  end
end
