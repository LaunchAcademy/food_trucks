class Vote < ActiveRecord::Base
  validates :rating, presence: true
  validates :user, presence: true
  validates :user, uniqueness: { scope: :food_truck }
  belongs_to :food_truck
  belongs_to :user
end
