class Product < ActiveRecord::Base
  has_many :likes, dependent: :destroy
end
