require 'rails_helper'

feature 'user destroys a review', %Q{
  As a user (eventually admin)
  I want to remove a review from the site
  So that inappropriate reviews do not stay on the site
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
    within "#editing-review-#{review.id}" do
      choose 'It was OK'
      fill_in 'review_body', with: 'This is at least a 50-character change' +
        'to the original review'
    end
    save_and_open_page
    expect(page).to_not have_button("delete-review-#{review.id}")
  end
end
