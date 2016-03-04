class Brand < ActiveRecord::Base
  has_many :products
  belongs_to :look
end
