class ProductsController < ApplicationController

  def index
    @products = Product.all
    @categories = Product.select(:category).map(&:category).uniq
    @colors = Product.select(:color).map(&:color).uniq
  end

  def show
   @product = Product.find(params[:id])
  end

  def search 
    looks_list = params[:look].reject{|k,v| v == "0"}.keys
    brands = Brand.includes(:look).where(look: looks_list)
    @products = Product.where(brand: brands)
    respond_to do |format|
      format.html { render action: :index }
    end
  end 

end


