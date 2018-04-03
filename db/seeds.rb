# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'Faker'

Beach.destroy_all
User.destroy_all
Surfboard.destroy_all
Booking.destroy_all

beaches = [
  {
    name: Bondi,
    latitude: -33.891723,
    longitude: 151.276605
  },
  {
    name: Bronte,
    latitude: -33.903477,
    longitude: 151.268365
  },
  {
    name: Clovelly,
    latitude: -33.913511,
    longitude: 151.266333
  },
  {
    name: Coogee,
    latitude: -33.920098,
    longitude: 151.258328
  },
  {
    name: Maroubra,
    latitude: -33.949236,
    longitude: 151.256934
  },
  {
    name: Manly,
    latitude: -33.793262,
    longitude: 151.287695
  },
  {
    name: Cronulla,
    latitude: -34.055490,
    longitude: 151.155104
  }
]

beaches.each { |beach| Beach.create!(beach)}
