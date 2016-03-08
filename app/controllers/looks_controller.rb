class LooksController < ApplicationController

  def index
    search_params = session['search_params']
    @looks_selected = []
    @looks_selected = search_params['looks'].reject{|k,v| v == "0"}.keys if search_params
    @looks = Look.all
  end

end
