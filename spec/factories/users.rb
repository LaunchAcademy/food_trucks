FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "person#{n}@example.com" }
    password 'qwerty1234567'
    avatar File.open(File.join(Rails.root,
    '/spec/images/fancydoge.jpg'))
  end
end
