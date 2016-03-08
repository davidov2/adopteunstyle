class Product < ActiveRecord::Base
  has_many :likes, dependent: :destroy
  has_many :offers, dependent: :destroy
  belongs_to :brand
  validates_uniqueness_of :ean


  def size_array
    self.size.split(',')
  end

  def title_short
    self.title.split(":")[0] unless self.title.nil?
  end

  def best_offer
    self.offers.min_by{ |offer| offer.price }
  end


end
