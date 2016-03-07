class Offer < ActiveRecord::Base
  belongs_to :product

  validates :price, presence: true
  validates :product, presence: true
  validates :supplier, presence: true

end
