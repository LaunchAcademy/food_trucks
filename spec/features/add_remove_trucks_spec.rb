require 'rails_helper'

feature 'user adds a new truck', %Q{
  As a user
  I want to add a new truck I found.
  Edit trucks I mispelled
  Delete trucks I have posted to keep it seceret.
} do

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
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end

  scenario 'user tries to add a blank food truck' do
    user = FactoryGirl.create(:user)
    sign_in_as(user)

    visit new_food_truck_path
    click_on 'Submit'
    expect(page).to have_content 'Uh oh! Your food truck could not be saved.'
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

  scenario 'user can remove a truck they created' do
    truck = FactoryGirl.create(:food_truck)
    sign_in_as(truck.user)

    visit food_truck_path(truck)

    click_on 'Delete Food Truck'

    expect(page).to_not have_content truck.name
  end

  scenario 'user can not edit a truck they did not create' do
    user = FactoryGirl.create(:user)
    truck = FactoryGirl.create(:food_truck)

    sign_in_as(user)
    visit food_truck_path(truck)

    expect(page).to_not have_button 'Edit Food truck'
  end

  scenario 'user can not remove a truck they did not create' do

    user = FactoryGirl.create(:user)
    truck = FactoryGirl.create(:food_truck)

    sign_in_as(user)
    visit food_truck_path(truck)

    expect(page).to_not have_button 'Delete Food truck'
  end

end
