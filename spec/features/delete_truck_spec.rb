require 'rails_helper'

feature 'user adds a new truck', %Q{
  As a user
  I want to add a new truck I found.
} do

  scenario 'user can remove a truck they created' do
    truck = FactoryGirl.create(:food_truck)
    sign_in_as(truck.user)

    visit food_truck_path(truck)

    click_on 'Delete Food Truck'

    expect(page).to_not have_content truck.name
  end

  scenario 'user can not remove a truck they did not create' do

    user = FactoryGirl.create(:user)
    truck = FactoryGirl.create(:food_truck)

    sign_in_as(user)
    visit food_truck_path(truck)

    expect(page).to_not have_button 'Delete Food truck'
  end
end
