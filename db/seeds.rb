# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
supplier = Supplier.create(name: 'supplier1', email: 'supplier1@gmail.com', phone: '8997373300',
                           password: 'password', password_confirmation: 'password')

buyer = Buyer.create(name: 'buyer1', email: 'buyer1@gmail.com', phone: '6373747493',
                     password: 'password', password_confirmation: 'password')

[supplier, buyer].each do |u|
  u.create_address(address_line: Faker::Address.street_address,
                   city: Faker::Address.city,
                   postal_code: Faker::Address.zip_code,
                   state: Faker::Address.state,
                   country: Faker::Address.country)
end

5.times do
  Category.create(name: Faker::Lorem.word)
end

Category.all.each do |category|
  category.products.create(supplier: Supplier.last, sku: rand(10000), name: Faker::Lorem.word,
                           description: Faker::Lorem.paragraph, price: rand(1000))
end
