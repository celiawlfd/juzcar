# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'
require "open-uri"


puts "cleaning database"
House.destroy_all
User.destroy_all


puts 'Creating 20 fake houses...'


user = User.new(
  username: "celiawilford",
  characteristic: "???",
  email: "celia@wilford.com",
  password: "123456"
)
user.save

puts user.valid?

20.times do
  file = URI.open("https://static.wikia.nocookie.net/smurfs/images/f/ff/Smurf_House.png/revision/latest?cb=20110912224438")
  house = House.new(
    name: Faker::TvShows::Friends.location,
    address: Faker::Address.street_address,
    price_per_night: rand(1000..5000),
    number_of_people: rand(1..10),
    description: Faker::Quotes::Shakespeare.romeo_and_juliet_quote,
  )

  house.user = user

  house.photos.attach(io: file, filename: "house.png", content_type: "image/png")
  puts house.photos.attached?
  house.save
  puts "Creating id for : #{house[:id]}"
end
