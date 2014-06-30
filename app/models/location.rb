class Location < ActiveRecord::Base
  validates :name, presence: true
  validates :latitude, presence: true, numericality: true
  validates :longitude, presence: true, numericality: true

  has_many :stops
end
