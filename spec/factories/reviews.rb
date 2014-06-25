FactoryGirl.define do
  factory :review do
    user
    food_truck
    rating 5
    sequence(:body) { |n| "This is the body and it must be 50#{n} characters long. I like this food truck.
      DogeDogeDogeDogeDogeDogeDogeDogeDogeDogeDogeDoge" }
  end
end
