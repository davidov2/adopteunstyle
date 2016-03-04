class ProductsController < ApplicationController

  def index
    @products = Product.all
    @categories = Product.select(:category).map(&:category).uniq
    @colors = Product.select(:color).map(&:color).uniq
  end

  def show
   @product = Product.find(params[:id])
  end

end


