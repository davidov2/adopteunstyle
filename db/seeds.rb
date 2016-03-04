require 'open-uri'

Product.destroy_all

tradedoubler_category_id_to_category_name = {'170' => 'Veste'}

supplier = Array.new

# Add a new supplier
supplier.push({
  name: 'Hugo Boss',
  url: 'http://pf.tradedoubler.com/export/export?myFeed=14569274972813150&myFormat=14569262592813150',
  feed_type: 'tradedoubler'
})

# Un autre supplier (pas encore utilisé pour le moment)
# supplier.push({
#     name: 'Carnet de Vol',
#     url: 'http://url-de-mon-feed',
#     feed_type: 'Effiliation'
# })

supplier.each do |s|
  puts 'Importing from ' << s[:name] << ' (' << s[:feed_type] << ')'
  # Gestion importation feed en provenance de tradedoubler
  if s[:feed_type] == 'tradedoubler'
    docs = Nokogiri::Slop(open(s[:url]))
    products = docs.xpath('//product')
    products[0..20].each do |p|
      # Passe au suivant si l'ean n'est pas renseigné dans le flux
      next unless p.css('ean').first
      # Passe au suivante si c'est pas pour homme
      next unless p.css('fields img_large').first.try(:content).try(:strip) == 'Men'
      # On insere le produit que s'il n'existe pas (clé : ean)
      product = Product.where(ean: p.css('ean').first.content.strip).first
      if product
        # On supprime les offres de ce produit pour ce supplier :
        product.offers.where(supplier: s[:name]).each do |o|
          o.destroy!
        end
      else
        # Bon le search avec css c'est crado je pense mais j'ai pas le temps ...
        product = Product.new
        product.title = p.css('name').first.content.gsub(/\n/, '').strip
        product.image = p.css('imageurl').first.content.strip unless p.css('imageurl').first.nil?
        product.link = p.css('advertiserproducturl').first.content.strip
        product.description = p.css('description').first.content.strip
        product.ean = p.css('ean').first.content.strip
        product.size = p.css('size').first.content.strip
        product.color = p.css('fields colour').first.content.strip
        product.brand = Brand.first_or_create!(name: p.css('brand').first.content.strip)
        if category = p.css('TDCategoryID').first
          product.category = tradedoubler_category_id_to_category_name[category.content.strip]
        end
        product.save!
      end
      # On insert l'offre
      product.offers.new(supplier: s[:name], price: p.css('price').first.content.strip).save!
    end
  end
end

exit!

# Seed User
user1 = User.first_or_create!(email: "admin@admin.com", password: "12345678")

# Seed Look
look1 = Look.first_or_create!(name: "Sport")

# Seed Choice
choice1 = Choice.first_or_create!(user: user1, look: look1)

# Seed Brand
10.times do |n|
  puts n
  Brand.first_or_create!(name: 'Marque ' << n.to_s, description:'Description de la marque ' << n.to_s)
end

# Seed Product
20.times do
  Product.first_or_create!(title: Faker::Commerce.product_name,
    description: Faker::Hipster.sentences,
    size: Faker::Number.between(1, 10),
    price: Faker::Commerce.price,
    color: Faker::Color.color_name,
    brand: Faker::Lorem.word,
    product_type: Faker::Hipster.word)
end
