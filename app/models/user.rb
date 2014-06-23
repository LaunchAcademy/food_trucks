class User < ActiveRecord::Base
  has_many :food_trucks, through: :user_trucks
  has_many :reviews
end
