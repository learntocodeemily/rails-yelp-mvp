# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Restaurant.destroy_all # if Rails.env.development?

5.times do
  r = Restaurant.create!(name: Faker::Restaurant.name,
                         category: ['chinese', 'japanese', 'french', 'italian', 'belgian'].sample,
                         address: Faker::Address.street_address,
                         phone_number: Faker::PhoneNumber.cell_phone
                         )
  puts "Created #{r.name}"
end

