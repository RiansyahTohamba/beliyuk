# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
Merchant.create!(name: "Adidas", image_url: "product_8.png", address: "Jl Cimahi", description: "The first sport merchant\r\n")
Merchant.create!(name: "Rabbani", image_url: "product_8.png", address: "Jl Cimahi", description: "The first hijub merchant\r\n")
Product.create!(title: "tas bagus", description: "spesifikasi singkat aja ya gan / sis untuk produk,...", image_url: "product_2.png", price: 0.224e2, merchant_id: 1)
Product.create!(title: "yellow sweater", description: "spesifikasi singkat aja ya gan / sis untuk produk,...", image_url: "product_2.png", price: 0.224e2, merchant_id: 1)
Product.create!(title: "yellow sweater", description: "spesifikasi singkat aja ya gan / sis untuk produk,...", image_url: "product_2.png", price: 0.224e2, merchant_id: 2)
