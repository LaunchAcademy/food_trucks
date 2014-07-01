require 'rails_helper'

feature 'user creates a new review for a truck', %Q(
  As a site visitor
  I want to be able to add a review for a truck I have tried
  so I can let my friends know if a truck is good
) do

  scenario 'user enters a review' do
    ActionMailer::Base.deliveries = []
    user = FactoryGirl.create(:user)
    sign_in_as(user)

    expect(ActionMailer::Base.deliveries.size).to eql(0)

    food_truck = FactoryGirl.create(:food_truck)
    review = FactoryGirl.build(:review, user: user)
    visit food_truck_path(food_truck)

    within('.new_review') do
      choose 'Fantastic'
      fill_in 'review_body', with: review.body
    end

    click_on 'Submit'

    expect(ActionMailer::Base.deliveries.size).to eql(1)
    last_email = ActionMailer::Base.deliveries.last
    expect(last_email.subject).to eql('Someone has written a new ' \
      'review on your food truck!')
    expect(last_email.to.first).to eql(user.email)

    expect(page).to have_content 'Your review was saved!'
    expect(page).to_not have_content 'Your review could not be saved'
  end

  scenario 'review without required attributes' do
    ActionMailer::Base.deliveries = []
    user = FactoryGirl.build(:user)
    expect(ActionMailer::Base.deliveries.size).to eql(0)

    visit new_user_registration_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password
    click_on 'Sign up'

    food_truck = FactoryGirl.create(:food_truck)
    review = FactoryGirl.build(:review, food_truck: food_truck)

    visit food_truck_path(food_truck)
    click_on 'Submit'

    expect(ActionMailer::Base.deliveries.size).to eql(0)
    expect(page).to_not have_content review.body
    expect(page).to_not have_content 'Your review was saved!'
    expect(page).to have_content 'can\'t be blank'
  end

  scenario 'user can not add a review if they have already reviewed a truck' do
    ActionMailer::Base.deliveries = []
    user = FactoryGirl.create(:user)
    sign_in_as(user)
    expect(ActionMailer::Base.deliveries.size).to eql(0)

    food_truck = FactoryGirl.create(:food_truck)
    review = FactoryGirl.build(:review)
    visit food_truck_path(food_truck)
    choose 'Fantastic'
    fill_in 'review_body', with: review.body
    click_on 'Submit'

    review = FactoryGirl.create(:review)
    visit food_truck_path(food_truck)
    within('.new_review') do
      choose 'Fantastic'
      fill_in 'review_body', with: review.body
    end

    click_on 'Submit'

    # Expect an email to have gone out only for the first review submission
    expect(ActionMailer::Base.deliveries.size).to eql(1)
    expect(page).to_not have_content 'Your review was saved!'
    expect(page).to have_content 'has already been taken'
  end
end
