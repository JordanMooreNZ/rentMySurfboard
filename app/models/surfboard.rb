class Surfboard < ApplicationRecord
  belongs_to :beach
  belongs_to :user
  has_many :bookings

  serialize :price_hash

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  mount_uploader :photo, PhotoUploader

  enum board_type: {
    shortboard: "Shortboard",
    fish: "Fish",
    gun: "Gun",
    longboard: "Longboard",
    mini_mal: "Mini-Mal",
    funboard: "Funboard",
    foamboard: "Foamboard",
    sup: "SUP",
    board_skimmer: "Board Skimmer"
  }

  private

  def cancel_bookings
    self.bookings.each { |booking| booking.update(status: :cancelled) }
  end
end
