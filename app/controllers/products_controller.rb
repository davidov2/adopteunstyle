class ProductsController < ApplicationController

  def index
    @products = Product.all
    @categories = Product.select(:category).map(&:category).uniq || []
    @colors = Product.select(:color).map(&:color).uniq
  end

  def show
   @product = Product.find(params[:id])
  end

  def search
    session['search_params'] = params
    looks = params[:looks].reject{|k,v| v == "0"}.keys
    brands = Brand.includes(:look).where(look: looks)
    @products = Product.includes(:brand).where(brand: brands)
    @categories = Product.select(:category).map(&:category).uniq || []
    @colors = Product.select(:color).map(&:color).uniq

    respond_to do |format|
      format.html { render action: :index }
    end
  end

end


