require 'rails_helper'

feature 'only admin user destroys a food truck', %Q(
  As an admin user
  I want to remove a food truck from the site
  So that only food trucks still in operation are displayed
) do

  scenario 'admin user deletes a food truck' do
    admin = FactoryGirl.create(:user, :admin)
    sign_in_as(admin)

    food_truck = FactoryGirl.create(:food_truck)

    visit food_truck_path(food_truck)
    click_on "delete-truck-#{food_truck.id}"

    expect(page).to have_content('Truck deleted!')
    expect(page).to_not have_content(food_truck.name)
  end

  scenario 'non-admin user tries to delete a food truck' do
    user = FactoryGirl.create(:user)

    sign_in_as(user)

    food_truck = FactoryGirl.create(:food_truck)

    visit food_truck_path(food_truck)
    expect(page).to_not have_button("delete-truck-#{food_truck.id}")
  end
end
