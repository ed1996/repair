class Company < ActiveRecord::Base
  belongs_to :user
  
  validates :category_artisan, presence: true
  validates :listingname, presence: true
  validates :address, presence: true
  validates :phone, presence: true, length: {maximum: 10, minimum: 10}
  validates :siret, presence: true, length: {maximum: 15, minimum: 15}
  validates :price, presence: true, numericality: {only_integer: true}
end
