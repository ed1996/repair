class Company < ActiveRecord::Base
  belongs_to :user
  has_many :photos
  has_many :reviews
  
  validates :category_artisan, presence: true
  validates :listingname, presence: true
  validates :address, presence: true
  validates :phone, presence: true, length: {maximum: 10, minimum: 10}
  validates :siret, presence: true, length: {maximum: 15, minimum: 15}
  validates :price, presence: true, numericality: {only_integer: true}
  
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  
  def average_rating
    reviews.count == 0 ? 0 : reviews.average(:star).round(2)
  end
end
