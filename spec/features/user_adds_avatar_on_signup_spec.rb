require 'rails_helper'
feature 'user adds an avatar', %Q(
  As a site visitor
  I want to add an avatar
  So that other people can enjoy my lovely face
) do

  scenario 'user uploads an avatar' do

    user = FactoryGirl.build(:user)

    visit new_user_registration_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password

    attach_file 'user_avatar',
      File.join(Rails.root, '/spec/images/fancydoge.jpg')

    click_on 'Sign up'

    expect(User.count).to eq(1)
    expect(page).to have_content 'successfully'
    expect(page).to have_css("img[src*='fancydoge']")
  end
end
