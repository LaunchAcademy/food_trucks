require 'rails_helper'

feature 'user creates a new user', %Q{
  As a site visitor
  I want to add myself as a user
  So that other people can enjoy their crazy antics
} do

  attrs = {
    name: 'joeSchmo',
    email: 'joe@schmo.com',
    photo: 'placeholder',
    role: 'member',
    password: 'qwer1234'
    }



  scenario 'user creates a profile' do
    user = User.new(attrs)

    #binding.pry

    visit "/users/new"
    fill_in 'Name', with: user.name
    fill_in 'Email', with: user.email
    fill_in 'password', with: user.password
    fill_in 'verify password', with: user.password
    click_on 'Create User'

    expect(page).to have_content 'Success'
    expect(page).to have_content user.name
  end

  scenario 'user passwords have to match' do
    user = User.new(attrs)

    #binding.pry

    visit "/users/new"
    fill_in 'Name', with: user.name
    fill_in 'Email', with: user.email
    fill_in 'password', with: user.password
    fill_in 'verify password', with: 'foobars1'
    click_on 'Create User'

    expect(page).to have_content 'do not match'
    expect(page).to have_content user.name
  end

  scenario 'without required attributes' do

    #user = User.create(attrs)

    visit "/users/new"
    click_on 'Create User'

    expect(page).to_not have_content 'Success'
    expect(page).to have_content "can't be blank"
  end

  scenario 'user cannot add a user that is already in the database' do

    user = User.create(attrs)

    visit "/users/new"
    fill_in 'Name', with: user.name
    fill_in 'Email', with: user.email
    fill_in 'password', with: user.password
    fill_in 'verify password', with: user.password
    click_on 'Create User'

    visit "/users/new"
    fill_in 'Name', with: user.name
    fill_in 'Email', with: 'random@test.com'
    fill_in 'password', with: user.password
    fill_in 'verify password', with: user.password
    click_on 'Create User'

    expect(page).to_not have_content 'Success'
    expect(page).to have_content "has already been taken"
  end

  scenario 'user cannot add a user with an email that is already in the database' do

    user = User.create(attrs)

    visit "/users/new"
    fill_in 'Name', with: user.name
    fill_in 'Email', with: user.email
    fill_in 'password', with: user.password
    fill_in 'verify password', with: user.password
    click_on 'Create User'

    visit "/users/new"
    fill_in 'Name', with: 'schmozeby'
    fill_in 'Email', with: user.email
    fill_in 'password', with: user.password
    fill_in 'verify password', with: user.password
    click_on 'Create User'

    expect(page).to_not have_content 'Success'
    expect(page).to have_content "has already been taken"
  end
end



