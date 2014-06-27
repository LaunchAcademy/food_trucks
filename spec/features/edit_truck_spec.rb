require 'rails_helper'

feature 'user adds a new truck', %Q(
  As a user
  I want to add a new truck I found.
) do

  scenario 'user can not edit a truck they did not create' do
    user = FactoryGirl.create(:user)
    truck = FactoryGirl.create(:food_truck)

    sign_in_as(user)
    visit food_truck_path(truck)

    expect(page).to_not have_button 'Edit Food truck'
  end

  scenario 'user can not go to an edit page that is not yours' do
    user = FactoryGirl.create(:user)
    truck = FactoryGirl.create(:food_truck)

    sign_in_as(user)
    visit edit_food_truck_path(truck)

    expect(page).to have_content 'You did not post this food truck.'
  end

  scenario 'user can edit a truck they created' do
    truck = FactoryGirl.create(:food_truck)

    sign_in_as(truck.user)
    visit food_truck_path(truck)

    click_on 'Edit Food Truck'
    fill_in 'Name', with: 'New Truck'
    click_on 'Save changes'

    expect(page).to have_content 'New Truck'
  end

  scenario 'user tries to edit a food truck and leaves description blank' do
    truck = FactoryGirl.create(:food_truck)
    sign_in_as(truck.user)

    visit food_truck_path(truck)
    click_on 'Edit Food Truck'
    fill_in 'Description', with: ''
    click_on 'Save changes'
    expect(page).to have_content 'Uh oh! Your Food Truck could not be updated.'
    expect(page).to have_content 'Description can\'t be blank'
  end

  scenario 'user tries to edit a food truck with too short of a description' do
    truck = FactoryGirl.create(:food_truck)
    sign_in_as(truck.user)

    visit food_truck_path(truck)
    click_on 'Edit Food Truck'
    fill_in 'Description', with: 'Short description here'
    click_on 'Save changes'
    expect(page).to have_content 'Description is too short ' +
    '(minimum is 50 characters)'
  end
end
