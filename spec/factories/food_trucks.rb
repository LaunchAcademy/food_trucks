FactoryGirl.define do
  sequence(:name) do |n|
    "Stokes#{n}"
  end

  factory :food_truck do
    name
    description 'This is the body and it must be 50 characters long. I like this food truck.'
    category 'Pizza'
    user
  end
end
