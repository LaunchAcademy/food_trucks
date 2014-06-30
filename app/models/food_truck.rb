class FoodTruck < ActiveRecord::Base
  acts_as_votable

  validates :name, :description, :category, presence: true
  validates :description, length: { minimum: 50 }
  validates :user, presence: true

  has_many :reviews
  belongs_to :user
end
