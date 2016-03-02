class Product < ActiveRecord::Base
  has_many :likes, dependent: :destroy
  has_many :offers, dependent: :destroy
  belongs_to :brand
  validates_uniqueness_of :ean
end
