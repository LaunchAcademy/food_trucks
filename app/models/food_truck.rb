class FoodTruck < ActiveRecord::Base
  validates :name, :description, :category, presence: true
  validates :description, length: { minimum: 25 }
  validates :user, presence: true
  validates :api_identifier, uniqueness: true,
    if: Proc.new { |ft| ft.api_identifier.present? }

  has_many :reviews
  belongs_to :user
  has_many :stops
  has_many :locations, through: :stops
end
