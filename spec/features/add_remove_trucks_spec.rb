require 'rails_helper'

feature 'user adds a new truck', %Q{
  As a user
  I want to add a new truck I found.
} do

  scenario 'user can add a food truck' do
    attrs = {
      name: 'stokes',
      description: 'This is at least a fifty-character description of a food truck.',
      category: 'Pizza'
    }

    truck = FoodTruck.build(attrs)

    visit new_food_trucks_path
    fill_in 'Name', with: truck.name
    fill_in 'Category', with: truck.category
    fill_in 'Description', with: truck.description
    click_on 'Create Food truck'

    expect(page).to have_content truck.name
  end

  scenario 'user can not add a food truck if they are not signed in' do
    visit new_food_trucks_path
    expect(page).to have_content "You must be signed in to do that."
  end

end
