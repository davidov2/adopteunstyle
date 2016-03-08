require 'open-uri'

Feed.destroy_all

Feed.create!(supplier: "Hugo boss", adapter: "tradedoubler", url: 'https://gist.githubusercontent.com/michael13013/a5d0ff98977285c095b9/raw/b1a160ee885fe6e0f028e62230e2fabedffcc0ad/tradedoubler.xml')
Feed.create!(supplier: "unkut", adapter: "effiliation", url: 'https://gist.githubusercontent.com/michael13013/8fb8fa84c75d1e95d5f0/raw/cb06cf917aaa4fe38b73b7e0a601a500a927c1c6/unkut.xml')
# Feed.create!(supplier: "carnetdevol", adapter: "effiliation", url: 'http://feeds.effiliation.com/myformat/13421676/ean')


Product.destroy_all

# Un autre supplier (pas encore utilisé pour le moment)
# supplier.push({
#     name: 'Carnet de Vol',
#     url: 'http://url-de-mon-feed',
#     feed_type: 'Effiliation'
# })

# supplier.each do |s|
#   puts 'Importing from ' << s[:name] << ' (' << s[:feed_type] << ')'
#   # Gestion importation feed en provenance de tradedoubler
#   if s[:feed_type] == 'tradedoubler'
#     docs = Nokogiri::Slop(open(s[:url]))
#     products = docs.xpath('//product')
#     products[0..20].each do |p|
#       # Passe au suivant si l'ean n'est pas renseigné dans le flux
#       next unless p.css('ean').first
#       # Passe au suivante si c'est pas pour homme
#       next unless p.css('fields img_large').first.try(:content).try(:strip) == 'Men'
#       # On insere le produit que s'il n'existe pas (clé : ean)
#       product = Product.where(ean: p.css('ean').first.content.strip).first
#       if product
#         # On supprime les offres de ce produit pour ce supplier :
#         product.offers.where(supplier: s[:name]).each do |o|
#           o.destroy!
#         end
#       else
#         # Bon le search avec css c'est crado je pense mais j'ai pas le temps ...
#         product = Product.new
#         product.title = p.css('name').first.content.gsub(/\n/, '').strip
#         product.image = p.css('imageurl').first.content.strip unless p.css('imageurl').first.nil?
#         product.link = p.css('advertiserproducturl').first.content.strip
#         product.description = p.css('description').first.content.strip
#         product.ean = p.css('ean').first.content.strip
#         product.size = p.css('size').first.content.strip
#         product.color = p.css('fields colour').first.content.strip
#         product.brand = Brand.first_or_create!(name: p.css('brand').first.content.strip)
#         if category = p.css('TDCategoryID').first
#           product.category = tradedoubler_category_id_to_category_name[category.content.strip]
#         end
#         product.save!
#       end
#       # On insert l'offre
#       product.offers.new(supplier: s[:name], price: p.css('price').first.content.strip).save!
#     end
#   end
# end

# Seed User

user1 = User.first_or_create!(email: 'admin@admin.com', password: '12345678', admin: true)
>>>>>>> d0451887335e9a1f962a6a2226c803e26b916596

# Seed Look
Look.destroy_all
# look1 = Look.create!( name: "BUSINESS Présentable en toutes circonstances", photo:"looks/look-9.png")
# Look.create!( name: "CREATEURS Les dernières nouveautés des designers", photo:"looks/look-9.png")
# Look.create!( name: "DENIM Décontracté et jeans basiques", photo:"looks/look-9.png")
# Look.create!( name: "LUXE Hautes gammes", photo:"looks/look-9.png")
# Look.create!( name: "NAUTIQUE Look maritime", photo:"looks/look-9.png")
# Look.create!( name: "ROCK Look branché pour rockers urbains", photo:"looks/look-9.png")
# Look.create!( name: "SPORT Look sportif", photo: "looks/look-9.png")
# Look.create!( name: "STREETWEAR Décontracté urbain", photo:"looks/look-9.png")
# Look.create!( name: "SURFWEAR Look on the beach..", photo:"looks/look-9.png")
# Look.create!( name: "Tout les looks", photo:"looks/look-all.png")

look1 = Look.create!( name: "BUSINESS", photo:"looks/look-9.png")
Look.create!( name: "CREATEURS", photo:"looks/look-9.png")
Look.create!( name: "DENIM", photo:"looks/look-9.png")
Look.create!( name: "LUXE", photo:"looks/look-9.png")
Look.create!( name: "NAUTIQUE", photo:"looks/look-9.png")
Look.create!( name: "ROCK", photo:"looks/look-9.png")
Look.create!( name: "SPORT", photo: "looks/look-9.png")
Look.create!( name: "STREETWEAR", photo:"looks/look-9.png")
Look.create!( name: "SURFWEAR", photo:"looks/look-9.png")
Look.create!( name: "TOUS", photo:"looks/look-all.png")


# Seed Choice
choice1 = Choice.first_or_create!(user: user1, look: look1)

=begin
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
=end
