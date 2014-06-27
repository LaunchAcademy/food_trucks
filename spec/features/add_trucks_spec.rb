require 'rails_helper'

feature 'user adds a new truck', %Q(
  As a user
  I want to add a new truck I found.
) do

  scenario 'user can add a food truck' do

    truck = FactoryGirl.build(:food_truck)

    sign_in_as(truck.user)

    visit new_food_truck_path

    fill_in 'Name', with: truck.name
    fill_in 'Category', with: truck.category
    fill_in 'Description', with: truck.description
    click_on 'Submit'

    expect(page).to have_content truck.name
  end

  scenario 'user can not add a food truck if they are not signed in' do
    visit new_food_truck_path
    expect(page).to have_content 'You need to sign in or' +
    ' sign up before continuing.'
  end

  scenario 'user tries to add a blank food truck' do
    user = FactoryGirl.create(:user)
    sign_in_as(user)

    visit new_food_truck_path
    click_on 'Submit'
    expect(page).to have_content 'Uh oh! Your food truck could not be saved.'
  end

  scenario 'user tries to add a food truck with no description' do
    user = FactoryGirl.create(:user)
    sign_in_as(user)

    visit new_food_truck_path
    click_on 'Submit'
    expect(page).to have_content 'Description can\'t be blank'
  end

  scenario 'user tries to add a food truck with too short of a description' do
    user = FactoryGirl.create(:user)
    sign_in_as(user)

    visit new_food_truck_path
    click_on 'Submit'
    expect(page).to have_content 'Description is too short ' +
    '(minimum is 50 characters)'
  end
end
