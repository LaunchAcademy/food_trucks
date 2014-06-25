FactoryGirl.define do
  factory :review do
    user
    food_truck
    rating 5
    body 'This is the body and it must be 50 characters long. I like this food truck.
      DogeDogeDogeDogeDogeDogeDogeDogeDogeDogeDogeDoge'
  end
end
