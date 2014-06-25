require 'rails_helper'

feature 'user views food truck index page', %Q{
  As a user
  I want to be able to see a page of food trucks (/foodtrucks)
  So that I can choose one and see its information and reviews
  and then continue to a new page to see the next set of trucks.
} do

  scenario 'user can view multiple pages of trucks' do
    25.times do |truck_number|
      food_truck = FoodTruck.create!(name: "Dumpling#{truck_number}", description: "This is at least a fifty-character description of a food truck.#{truck_number}", category: 'Dumplings')
    end

    visit food_trucks_path
    expect(page).to have_link 'Next ›'
    click_on 'Next ›'
    expect(page).to have_link '‹ Prev'
  end
end
