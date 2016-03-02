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




