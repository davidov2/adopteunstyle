class Look < ActiveRecord::Base
  has_many :choices, dependent: :destroy
  has_many :brands
end
