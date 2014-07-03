class FoodTruck < ActiveRecord::Base

  scope :reviews, -> {order('cached_votes_score desc')}

  validates :name, :description, :category, presence: true
  validates :description, length: { minimum: 25 }
  validates :user, presence: true
  validates :api_identifier, uniqueness: true,
    if: Proc.new { |ft| ft.api_identifier.present? }

  has_many :reviews, dependent: :destroy
  belongs_to :user
  has_many :stops, dependent: :destroy
  has_many :locations, through: :stops

  def self.search(search)
    if search
      FoodTruck.where('name ILIKE ?', "%#{search}%")
    else
      FoodTruck.all
    end
  end
end
