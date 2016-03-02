# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Seed product
# Product.destroy_all

# product1 = Product.create!(title: "jean", description: "taille basse", brand: "Levi's")
# product2 = Product.create!(title: "chemise", description: "chemise blanche", brand: "Lacoste")

# Seed User
User.destroy_all
user1 = User.create!(email: "admin@admin.com", password: "12345678")

# Seed Look
Look.destroy_all
look1 = Look.create!(name: "Sport")


# Seed Choice
Choice.destroy_all
choice1 = Choice.create!(user: user1, look: look1)

# Seed Like
# Like.destroy_all
# like1 = Like.new
# like1.product = product1
# like1.user = user1
# like1.save!


