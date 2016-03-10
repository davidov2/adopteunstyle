class ProductsController < ApplicationController

  def index
    @products = Product.all.page(params[:page]).per(30)
    #.all.paginate(page: params[:page], per_page: 30)
    @categories = Product.select(:category).map(&:category).uniq || []
    @colors = Product.select(:color).map(&:color).uniq
  end

  def show
   @product = Product.find(params[:id])
  end

  def search
    #session['search_params'] = params

    query = params[:query]
    size = params[:size]
    unless query.blank?
      @products = Product.search_engine(query).page(params[:page]).per(30)
    end
    unless size.blank?
      product_ids = Offer.search_engine_size(size).map do |o|
       o.product_id
      end
      @products = Product.where(id: product_ids).page(params[:page]).per(30)
    end
    @total = @products.try(:total_count)
    #@size = Offer.search_engine_size(query).products.page(params[:page]).per(30)
    unless params[:looks].blank?
      looks = params[:looks].reject{|k,v| v == "0"}.keys
      brands = Brand.includes(:look).where(look: looks)
      @products = Product.includes(:brand).where(brand: brands).page(params[:page]).per(30)
    end
    @categories = Product.select(:category).map(&:category).uniq || []
    @colors = Product.select(:color).map(&:color).uniq
    respond_to do |format|
      format.html { render action: :index }
    end
  end

end


