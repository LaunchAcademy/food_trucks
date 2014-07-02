class Stop < ActiveRecord::Base
  validates :location, presence: true
  validates :food_truck, presence: true
  validates :time_arrive, presence: true, numericality: { only_integer: true }

  validates_uniqueness_of :time_arrive, scope: [:food_truck_id, :location_id]

  belongs_to :location
  belongs_to :food_truck
end
