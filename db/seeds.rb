# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Seeding..."

Product.create(
  name: 'MacBook Pro 14\'',
  price: 1999.99,
  description: '14 inch MacBook Pro, 512GB, 16GB RAM',
  status: 'active',
  image: 'https://d1fmx1rbmqrxrr.cloudfront.net/cnet/i/edit/2021/10/apple-macbook-pro-14-2021-1200.jpg'
)

puts "Seeding done."