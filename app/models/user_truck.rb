class UserTruck < ActiveRecord::Base
  validates :user_id, :food_truck_id, presence: true

  belongs_to :food_truck
  belongs_to :user
end
