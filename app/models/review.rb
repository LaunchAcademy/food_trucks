class Review < ActiveRecord::Base
  validates :rating, :body, :user_id, :food_truck_id, presence: true
  validates :user_id, uniqueness: { scope: :food_truck_id }

  belongs_to :food_truck
  belongs_to :user
end
