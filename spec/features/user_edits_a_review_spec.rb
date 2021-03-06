require 'rails_helper'

feature 'user edits a review', %Q(
  As a user
  I want to edit a review which I wrote
  So that I can make additions and correct mistakes
) do

  scenario 'user successfully edits a review' do
    user = FactoryGirl.create(:user)
    sign_in_as(user)

    food_truck = FactoryGirl.create(:food_truck)
    review = FactoryGirl.create(:review, food_truck: food_truck, user: user)

    visit food_truck_path(food_truck)
    within "#editing-review-#{review.id}" do
      choose 'It was OK'
      fill_in 'review_body', with: 'This is at least a 50-character change' +
        'to the original review'
    end
    click_on 'Save changes'

    expect(page).to have_content('Changes saved!')
    expect(page).to_not have_content(review.body)
  end

  scenario 'user tries to edit a review which is not his/her own' do
    user = FactoryGirl.create(:user)
    review = FactoryGirl.create(:review)

    sign_in_as(user)
    visit food_truck_path(review.food_truck)

    expect(page).to have_content(review.body)
    expect(page).to_not have_button('Save changes')
  end
end
