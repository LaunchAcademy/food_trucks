require 'rails_helper'

feature 'user creates a new review for a truck', %Q{
  As a site visitor
  I want to be able to add a review for a truck I have tried
  so I can let my friends know if a truck is good
} do

  scenario 'user enters a review' do
    user = FactoryGirl.build(:user)

    visit new_user_registration_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password
    click_on 'Sign up'

    food_truck = FactoryGirl.create(:food_truck)
    review = FactoryGirl.create(:review)
    visit food_truck_path(food_truck)
    choose ('Fantastic')
    fill_in ('review_body'), with: review.body
    click_on 'Submit'

    expect(page).to have_content 'Your review was saved!'
    expect(page).to_not have_content 'Your review could not be saved'
  end

  scenario 'review without required attributes' do
    user = FactoryGirl.build(:user)

    visit new_user_registration_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password
    click_on 'Sign up'

    food_truck = FactoryGirl.create(:food_truck)
    review = FactoryGirl.create(:review)

    visit food_truck_path(food_truck)
    click_on 'Submit'

    expect(page).to_not have_content 'Your review was saved!'
    expect(page).to have_content "can't be blank"
  end

  scenario 'review can not add a review if they have already reviewed a truck' do

    user = FactoryGirl.build(:user)

    visit new_user_registration_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password
    click_on 'Sign up'

    food_truck = FactoryGirl.create(:food_truck)
    review = FactoryGirl.create(:review)
    visit food_truck_path(food_truck)
    choose ('Fantastic')
    fill_in ('review_body'), with: review.body
    click_on 'Submit'

    review = FactoryGirl.create(:review)
    visit food_truck_path(food_truck)
    choose ('Fantastic')
    fill_in ('review_body'), with: review.body
    click_on 'Submit'

    expect(page).to_not have_content 'Your review was saved!'
    expect(page).to have_content "has already been taken"
  end
end
