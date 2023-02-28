# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

puts "cleaning database"
House.destroy_all

puts 'Creating 20 fake houses...'
20.times do
  house = House.create(
    name: Faker::TvShows::Friends.location,
    address: Faker::Address.street_address,
    price_per_night: rand(1000..5000),
    number_of_people: rand(1..10),
    description: Faker::Quotes::Shakespeare.romeo_and_juliet_quote,
    user_id: 1
  )
  puts "Creating id for : #{house[:id]}"
end
