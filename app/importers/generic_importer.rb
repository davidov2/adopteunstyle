class GenericImporter

  def initialize(feed)
    @feed = feed
    @import = Import.create(feed: feed)
    @error = 0
    @success = 0
  end


  def import
    adapter = load_adapter(@feed)
    importation do
      docs = adapter.open_feed(@feed.url)
      docs.each do |line|
        attributes = adapter.parse(line)
        addProduct(attributes)
      end
    end
  end

  private

  def importation
    @import.started_at = Time.now
    @import.update(status: :pending)
    begin
      yield
      @import.update(status: :success)
    rescue => e
      @import.message = e
      @import.update(status: :error)
    end
    puts "Produits : success => #{@success}, errors => #{@error}"
    total = @success+@error
    success_rate = total==0 ? 0 : @success.fdiv(total)
    @import.update(finished_at: Time.now, total: total, success_rate: success_rate)
  end


  def load_adapter(feed)
    adapter_prefix = feed.supplier.capitalize
    adapter = Object.const_get("#{adapter_prefix}Adapter")
    adapter.new
  end

  def addProduct(attributes={})
    # on vérifie si le produit existe déjà
    p = Product.find_by_ean(attributes[:ean])
    if p.nil?
      createProduct(attributes)
    else
      updateProduct(p, attributes)
    end
  end

  def updateProduct(p, attributes)
    p.offers.where(supplier: @feed.supplier).each do |o|
      o.destroy!
   end
    p.offers.build(supplier: @feed.supplier, price: attributes[:price])

    saveProduct(p)

  end

  def createProduct(attributes)
    p = Product.new
    p.ean = attributes[:ean]
    p.description = attributes[:description]
    p.link = attributes[:link]
    p.image = attributes[:image]
    p.color = attributes[:color]
    p.category = attributes[:category]
    p.brand = Brand.first_or_create(name: attributes[:brand])
    p.offers.build(price: attributes[:price], supplier: @feed.supplier )
    saveProduct(p)
  end

  def saveProduct(product)
    if product.save
      @success += 1
    else
      @error += 1
      p product.errors.messages
    end
  end

end
