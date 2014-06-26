require 'rails_helper'

feature 'user views food truck index page', %Q{
  As a user
  I want to be able to see a page of food trucks (/foodtrucks)
  So that I can choose one and see its information and reviews
  and then continue to a new page to see the next set of trucks.
} do

  scenario 'user can view multiple pages of trucks' do
    created_trucks = FactoryGirl.create_list(:food_truck, 11)

    visit food_trucks_path
    expect(page).to have_link 'Next ›'
    click_on 'Next ›'
    expect(page).to have_link '‹ Prev'
  end
end
