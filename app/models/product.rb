class Product < ActiveRecord::Base
  has_many :likes, dependent: :destroy
  belongs_to :brand
end
