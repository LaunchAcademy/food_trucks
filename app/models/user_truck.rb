class UserTruck < ActiveRecord::Base
  validates :user, presence: true
  validates :food_truck, presence: true
  belongs_to :food_truck
  belongs_to :user
end
