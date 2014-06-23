class Review < ActiveRecord::Base
  validates :rating, presence: true
  validates :body, presence: true
  validates :user_id, presence: true
  validates :food_truck_id, presence: true
  validates :user, uniqueness: { scope: :food_truck }
  validates_numericality_of :rating, inclusion: { in: 1..5 }

  belongs_to :food_truck
  belongs_to :user
end
