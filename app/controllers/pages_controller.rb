class PagesController < ApplicationController
  def home
      @contact = Contact.new
  end

  def contact
  end

end
