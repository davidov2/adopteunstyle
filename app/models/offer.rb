class Offer < ActiveRecord::Base
  belongs_to :product
  validates_presence_of :price, :product_id, :supplier
end
