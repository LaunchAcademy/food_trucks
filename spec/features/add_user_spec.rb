require 'rails_helper'

feature 'user creates a new user', %Q{
  As a site visitor
  I want to add myself as a user
  So that other people can enjoy their crazy antics
} do

  attrs = {
      title: 'Game of Thrones',
      network: 'HBO',
      years: '2011-',
      synopsis: 'Seven noble families fight for control of the mythical land of Westeros.'
    }



  scenario 'user adds a new character to a TV show' do
    show = TelevisionShow.new(attrs)
    show.save

    char_attrs = {
      name: 'Eddard Stark',
      actor: 'Sean Bean',
      description: 'Hamd of the King,Lord of Winterfell, and Warden of the North'
    }

    character = Character.new(char_attrs)

    #binding.pry

    visit "/television_shows/#{show.id}"
    fill_in 'Name', with: character.name
    fill_in 'Actor', with: character.actor
    fill_in 'Description', with: character.description
    click_on 'Create Character'

    expect(page).to have_content 'Success'
    expect(page).to have_content character.name
    expect(page).to have_content character.actor
    expect(page).to have_content character.description
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
