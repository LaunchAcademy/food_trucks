class User < ActiveRecord::Base
  validates :name, :email, presence: true

  has_many :food_trucks, through: :user_trucks
  has_many :reviews
end
