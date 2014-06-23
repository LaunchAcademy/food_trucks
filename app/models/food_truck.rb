class FoodTruck < ActiveRecord::Base
  validates :name, :description, :category, presence: true
  validates :description,  length: { minimum: 50 }

  has_many :reviews
  has_many :users, through: :user_trucks
end
