require 'rails_helper'

feature 'user votes on a review', %Q{
  As a user
  I want to be able to upvote a review that I like
  I also want to upvote the review after reading the description.
} do

  scenario 'user upvotes a review' do
    user = FactoryGirl.create(:user)
    food_truck = FactoryGirl.create(:food_truck)
    review = FactoryGirl.create(:review, food_truck: food_truck, user: user)

    sign_in_as(user)

    visit food_truck_path(food_truck)

    score = review.cached_votes_score
    expect(page).to have_content score

    click_on "Upvote"

    expect(page).to have_content(score+1)
  end

  scenario 'user downvotes a review' do
    user = FactoryGirl.create(:user)
    food_truck = FactoryGirl.create(:food_truck)
    review = FactoryGirl.create(:review, food_truck: food_truck, user: user)

    sign_in_as(user)

    visit food_truck_path(food_truck)

    score = review.cached_votes_score
    expect(page).to have_content score

    click_on "Downvote"

    expect(page).to have_content(score-1)
  end

  scenario 'user un-upvotes a review' do
    user = FactoryGirl.create(:user)
    food_truck = FactoryGirl.create(:food_truck)
    review = FactoryGirl.create(:review, food_truck: food_truck, user: user)

    sign_in_as(user)

    visit food_truck_path(food_truck)

    score = review.cached_votes_score

    click_on "Upvote"
    click_on "Upvote"

    expect(page).to have_content(score)
  end

  scenario 'user un-downvotes a review' do
    user = FactoryGirl.create(:user)
    food_truck = FactoryGirl.create(:food_truck)
    review = FactoryGirl.create(:review, food_truck: food_truck, user: user)

    sign_in_as(user)

    visit food_truck_path(food_truck)

    score = review.cached_votes_score

    click_on "Downvote"
    click_on "Downvote"

    expect(page).to have_content(score)
  end
end
