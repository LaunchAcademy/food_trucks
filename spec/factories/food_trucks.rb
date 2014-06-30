FactoryGirl.define do
  factory :food_truck do
    name 'stokes'
    description 'This is the body and it must be 50 characters long. I like this food truck.'
    category 'Pizza'
    api_identifier 'stokes'
    user
  end
end
