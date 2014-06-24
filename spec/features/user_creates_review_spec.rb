require 'rails_helper'

feature 'user creates a new review for a truck', %Q{
  As a site visitor
  I want to be able to add a review for a truck I have tried
  so I can let my friends know if a truck is good
} do

  scenario 'user enters a review' do

    food_truck = FactoryGirl.create(:food_truck)
    review = FactoryGirl.build(:review)
    review.food_truck = food_truck

    visit food_truck_path(food_truck)
    fill_in 'Rating', with: review.rating
    fill_in 'Body', with: review.body
    click_on 'Submit'

    expect(review.count).to eq(1)
    expect(page).to have_content 'success'
  end

  scenario 'review without required attributes' do

    visit food_truck_path(food_truck)
    click_on 'Submit'

    expect(page).to_not have_content 'success'
    expect(page).to have_content "can't be blank"
  end

  scenario 'review can not add a review if they have already reviewed a truck' do

    food_truck = FactoryGirl.build(:food_truck)
    review = FactoryGirl.build(:review)
    review.food_truck = food_truck

    visit food_truck_path(food_truck)
    fill_in 'Rating', with: review.rating
    fill_in 'Body', with: review.body
    click_on 'Submit'

    click_on 'Logout'

    visit food_truck_path(food_truck)
    fill_in 'Rating', with: review.rating
    fill_in 'Body', with: review.body
    click_on 'Submit'

    expect(page).to_not have_content 'Success'
    expect(page).to have_content "has already been taken"
  end
end
