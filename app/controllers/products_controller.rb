class ProductsController < ApplicationController

  def index
    @products = Product.all.paginate(page: params[:page], per_page: 30)
    @categories = Product.select(:category).map(&:category).uniq || []
    @colors = Product.select(:color).map(&:color).uniq
  end

  def show
   @product = Product.find(params[:id])
  end

  def search
    #session['search_params'] = params

    search = params[:query]

    @products = Product.search_by_title_and_description(search)

    # looks = params[:looks].reject{|k,v| v == "0"}.keys
    # brands = Brand.includes(:look).where(look: looks)
    #@products = Product.includes(:brand).where(brand: brands)
    @categories = Product.select(:category).map(&:category).uniq || []
    @colors = Product.select(:color).map(&:color).uniq
    respond_to do |format|
      format.html { render action: :index }
    end
  end

end


