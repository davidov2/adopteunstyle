require "Nokogiri"
require "open-uri"

class TradedoublerAdapter < GenericAdapter

  def open_feed(url)
    data = Nokogiri::Slop(open(url))
    docs = data.xpath('//products/product')
  end

  def ean(input)
    data_from_path(input, "ean")
  end

  def image(input)
    data_from_path(input, "imageurl")
  end

  def link(input)
    data_from_path(input, "advertiserproducturl")
  end

  def price(input)
    data_from_path(input, "price").to_i
  end

  def color(input)
    data_from_path(input, "fields colour")
  end

  def brand(input)
    data_from_path(input, "brand")
  end

  def category(input)
    data_from_path(input, "tdcategoryid")
  end

  def size(input)
    data_from_path(input, "size")
  end

  private

  def data_from_path(object, path)
    if object.css(path).first.nil?
      return ""
    else
      return object.css(path).first.content.strip
    end
  end


end
