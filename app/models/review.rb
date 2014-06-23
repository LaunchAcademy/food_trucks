class Review < ActiveRecord::Base
  validates :rating, :body, :user_id, :food_truck_id, presence: true
  validates :user_id, uniqueness: { scope: :food_truck_id }
  validates_numericality_of :rating, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1,
    less_than_equal_to: 5
  }

  belongs_to :food_truck
  belongs_to :user
end
