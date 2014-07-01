class FoodTruck < ActiveRecord::Base
  validates :name, :description, :category, presence: true
  validates :description, length: { minimum: 50 }
  validates :user, presence: true

  has_many :reviews
  belongs_to :user
  has_many :stops
end
