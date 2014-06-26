class Review < ActiveRecord::Base
  validates :rating, presence: true
  validates :user, presence: true
  validates :food_truck, presence: true
  validates :user, uniqueness: { scope: :food_truck }
  validates :rating, numericality: {only_integer: true }, inclusion: { in: 1..5 }

  belongs_to :food_truck
  belongs_to :user
end
