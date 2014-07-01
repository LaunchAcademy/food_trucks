class Location < ActiveRecord::Base
  validates :name, presence: true
  validates :latitude, presence: true, numericality: true
  validates :longitude, presence: true, numericality: true

  validates_uniqueness_of :name, scope: [:longitude, :latitude]

  has_many :stops
end
