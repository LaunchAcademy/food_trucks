class Stop < ActiveRecord::Base
  validates :location_id, presence: true, numericality: { only_integer: true }
  validates :food_truck_id, presence: true, numericality: true
  validates :time_arrive, presence: true, numericality: true

  belongs_to :location
  belongs_to :food_truck
end
