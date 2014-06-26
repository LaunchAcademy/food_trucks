class FoodTruck < ActiveRecord::Base
  validates :name, :description, :category, :user, presence: true
  validates :description, length: { minimum: 50 }

  has_many :reviews
  belongs_to :user
end
