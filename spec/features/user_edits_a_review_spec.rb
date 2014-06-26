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
    review = FactoryGirl.create(:review, food_truck: food_truck)

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

  scenario 'user tries to edit a review with a blank body' do
    user = FactoryGirl.create(:user)
    sign_in_as(user)

    food_truck = FactoryGirl.create(:food_truck)
    review = FactoryGirl.create(:review, food_truck: food_truck)

    visit food_truck_path(food_truck)
    within "#editing-review-#{review.id}" do
      choose 'It was OK'
      fill_in 'review_body', with: ''
    end
    click_on 'Save changes'

    expect(page).to_not have_content('Changes saved!')
    expect(page).to have_content('Body can\'t be blank')
  end

  scenario 'user tries to edit a review with too short of a body' do
    user = FactoryGirl.create(:user)
    sign_in_as(user)

    food_truck = FactoryGirl.create(:food_truck)
    review = FactoryGirl.create(:review, food_truck: food_truck)

    visit food_truck_path(food_truck)
    within "#editing-review-#{review.id}" do
      choose 'It was OK'
      fill_in 'review_body', with: 'This is a very short review'
    end
    click_on 'Save changes'

    expect(page).to_not have_content('Changes saved!')
    expect(page).to have_content('Body is too short (minimum is 50 characters)')
  end
end
