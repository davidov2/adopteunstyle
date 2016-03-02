# Seed User
user1 = User.create!(email: "admin@admin.com", password: "12345678")

# Seed Look
look1 = Look.create!(name: "Sport")

# Seed Choice
choice1 = Choice.create!(user: user1, look: look1)

# Seed Brand
10.times do |n|
  puts n
  Brand.create!(name: 'Marque ' << n.to_s, description:'Description de la marque ' << n.to_s)
end

# Seed Product
20.times do
  Product.create!(title: Faker::Commerce.product_name)
end
