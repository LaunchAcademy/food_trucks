require 'rails_helper'

feature 'Login and Signup', %Q{
  As a site visitor
  See a login button when I visit the page
  See a signup page so I can register
} do

  scenario 'user login' do

    visit root_path
    click_on 'Login'

    expect(page).to have_content "Email"
    expect(page).to have_content "Password"
    expect(page).to_not have_content "Password confirmation"
    expect(page).to have_button('Sign in')
  end

  scenario 'User visit sign-up' do

    visit root_path
    expect(page).to_not have_button('Logout')

    click_on 'Sign Up'

    expect(page).to have_content "Email"
    expect(page).to have_content "Password"
    expect(page).to have_content "Password confirmation"
    expect(page).to have_button('Sign up')
    expect(page).to_not have_link('Logout')
  end

  scenario 'User has logout button after login' do

    user = FactoryGirl.build(:user)

    visit new_user_registration_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password
    click_on 'Sign up'

    expect(page).to have_link('Logout')
    expect(page).to_not have_button('Sign in')
    expect(page).to_not have_button('Sign Up')

  end
end
