require 'rails_helper'

feature 'user views food truck index page', %Q{
  As a user
  I want to be able to see a page of food trucks (/foodtrucks)
  So that I can choose one and see its information and reviews
} do


  scenario 'user can view food trucks' do
    trucks = []

    truck1 = FoodTruck.new(name: "Stoked")
    truck1.save
    trucks << truck1

    truck2 = FoodTruck.new(name: "Meng's Kitchen")
    truck2.save
    trucks << truck2

    truck3 = FoodTruck.new(name: "Chicken and Rice Guys")
    truck3.save
    trucks << truck3

    visit '/food_trucks'

    trucks.each do |truck|
      expect(page).to have_content truck.name
    end
  end

  scenario 'without required attributes' do

    show = TelevisionShow.create(attrs)

    visit "/television_shows/#{show.id}"
    click_on 'Create Character'

    expect(page).to_not have_content 'Success'
    expect(page).to have_content "can't be blank"
  end

  scenario 'user cannot add a character that is already in the database' do

    char_attrs = {
      name: 'Eddard Stark',
      actor: 'Sean Bean'
    }

    show = TelevisionShow.create(attrs)
    character = Character.create(char_attrs)

    visit "/television_shows/#{show.id}"
    fill_in 'Name', with: character.name
    fill_in 'Actor', with: character.actor
    click_on 'Create Character'

    visit "/television_shows/#{show.id}"
    fill_in 'Name', with: character.name
    fill_in 'Actor', with: character.actor
    click_on 'Create Character'

    expect(page).to_not have_content 'Success'
    expect(page).to have_content "has already been taken"
  end
end
