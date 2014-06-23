class User < ActiveRecord::Base
  # TODO uncomment below and change truck show page test to reflect this
  # validates :name, :email, presence: true

  has_many :food_trucks, through: :user_trucks
  has_many :reviews
end
