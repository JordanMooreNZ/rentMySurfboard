# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'json'
require 'open-uri'

url = 'https://randomuser.me/api/'

Booking.destroy_all
Surfboard.destroy_all
User.destroy_all
Beach.destroy_all

beaches = [
  {
    name: "Bondi",
    latitude: -33.891723,
    longitude: 151.276605
  },
  {
    name: "Bronte",
    latitude: -33.903477,
    longitude: 151.268365
  },
  {
    name: "Clovelly",
    latitude: -33.913511,
    longitude: 151.266333
  },
  {
    name: "Coogee",
    latitude: -33.920098,
    longitude: 151.258328
  },
  {
    name: "Maroubra",
    latitude: -33.949236,
    longitude: 151.256934
  },
  {
    name: "Manly",
    latitude: -33.793262,
    longitude: 151.287695
  },
  {
    name: "Cronulla",
    latitude: -34.055490,
    longitude: 151.155104
  }
]

addresses = [
  '3 Doris St, North Sydney, NSW 2060',
  '161 Sussex St, Sydney, NSW 2001',
  '14 The Avenue, North Sydney, NSW 2060',
  '38 Simpson St, Bondi Beach, NSW 2026',
  '50 Park St, Sydney, NSW 2000',
  '123 Sussex St, Sydney, NSW 2001',
  '55 King St, Sydney, NSW 2001'
]

beaches.each { |beach| Beach.create!(beach)}

10.times do
  user_serialized = open(url).read
  user_hash = JSON.parse(user_serialized)["results"][0]

  user = {
    first_name: user_hash["name"]["first"],
    last_name: user_hash["name"]["last"],
    email: user_hash["email"],
    password: "password",
    password_confirmation: "password",
    profile_photo: user_hash["picture"]["large"],
    description: Faker::MostInterestingManInTheWorld.quote,
    mobile: user_hash["cell"]
  }

  User.create!(user)
end

surfboard_photos = [
  'https://www.surfstitch.com/dw/image/v2/BBCN_PRD/on/demandware.static/-/Sites-ss-master-catalog/default/dwace98d75/images/JSMBHFBKWHI/BLACK-WHITE-SURF-SURFBOARDS-JS-INDUSTRIES-PERFORMANCE-JSMBHFBKWHI_1.JPG?sw=263&sh=329&sm=fit',
  'https://www.surfstitch.com/dw/image/v2/BBCN_PRD/on/demandware.static/-/Sites-ss-master-catalog/default/dw60e149f4/images/CHIILLICHCLEAR/CLEAR-SURF-SURFBOARDS-CHILLI-PERFORMANCE-CHIILLICHCLEAR_1.JPG?sw=263&sh=329&sm=fit',
  'https://www.surfstitch.com/dw/image/v2/BBCN_PRD/on/demandware.static/-/Sites-ss-master-catalog/default/dwf026132c/images/HS-HYPTOFFV-0504-GRY/GREY-SURF-SURFBOARDS-HAYDENSHAPES-GSI-MID-LENGTH-HS-HYPTOFFV-0504-GRY_1.JPG?sw=263&sh=329&sm=fit',
  'https://www.surfstitch.com/dw/image/v2/BBCN_PRD/on/demandware.static/-/Sites-ss-master-catalog/default/dw3f985137/images/CIBANDWCLR/CLEAR-SURF-SURFBOARDS-CHANNEL-ISLANDS-PERFORMANCE-CIBANDWCLR_1.JPG?sw=263&sh=329&sm=fit',
  'https://www.surfstitch.com/dw/image/v2/BBCN_PRD/on/demandware.static/-/Sites-ss-master-catalog/default/dw88643838/images/STRL-BLM-046BLM/BLACK-MARBLE-SURF-SURFBOARDS-SOFTECH-FUNBOARD-STRL-BLM-046BLM_1.JPG?sw=263&sh=329&sm=fit',
  'https://www.surfstitch.com/dw/image/v2/BBCN_PRD/on/demandware.static/-/Sites-ss-master-catalog/default/dw946659ce/images/CHRAREBIRDCLR/CLEAR-SURF-SURFBOARDS-CHILLI-PERFORMANCE-CHRAREBIRDCLR_1.JPG?sw=263&sh=329&sm=fit',
  'https://www.surfstitch.com/dw/image/v2/BBCN_PRD/on/demandware.static/-/Sites-ss-master-catalog/default/dwe8d3a35f/images/MFSUSPARSPR/SPRAY-SURF-SURFBOARDS-MISFIT-PERFORMANCE-MFSUSPARSPR_1.JPG?sw=263&sh=329&sm=fit',
  'https://www.surfstitch.com/dw/image/v2/BBCN_PRD/on/demandware.static/-/Sites-ss-master-catalog/default/dw23588549/images/HS-PLUFF-0506-CLR/CLEAR-SURF-SURFBOARDS-HAYDENSHAPES-GSI-MID-LENGTH-HS-PLUFF-0506-CLR_1.JPG?sw=263&sh=329&sm=fit',
  'https://www.surfstitch.com/dw/image/v2/BBCN_PRD/on/demandware.static/-/Sites-ss-master-catalog/default/dw270f530d/images/HSLOVEBUZZFFWHTBK/WHITE-BLACK-SURF-SURFBOARDS-HAYDENSHAPES-PERFORMANCE-HSLOVEBUZZFFWHTBK_1.JPG?sw=263&sh=329&sm=fit',
  'https://www.surfstitch.com/dw/image/v2/BBCN_PRD/on/demandware.static/-/Sites-ss-master-catalog/default/dw9d422400/images/MVINVOLVEVOL/VOLAN-SURF-SURFBOARDS-MCTAVISH-LONGBOARD-MVINVOLVEVOL_1.JPG?sw=263&sh=329&sm=fit'
]

beachez = Beach.all
userz = User.all

surfboard_photos.each do |x|
  random_number = 20

  price_hash = Booking.durations.inject({}) do |res, (key, _label)|
    random_number += rand(10..20)
    res[key] = random_number ; res
  end

  surfboard_hash = {
    photo: x,
    beach: beachez.sample,
    name: Faker::BackToTheFuture.character,
    description: Faker::SiliconValley.motto,
    price_hash: price_hash,
    address:  addresses.sample,
    user: userz.sample,
    board_type: Surfboard.board_types.keys.sample,
    available: true
  }
  Surfboard.create!(surfboard_hash)
end

surfboardz = Surfboard.all

10.times do

booking_hash = [{
  surfboard: surfboardz.sample,
  user: userz.sample,
  duration: Booking.durations.keys.sample,
  rented_at: Date.today + rand(1..5),
  status: Booking.statuses.keys.sample
  }]

Booking.create!(booking_hash)

end
