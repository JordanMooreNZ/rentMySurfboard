class Surfboard < ApplicationRecord
  belongs_to :beach
  belongs_to :user

  enum board_type: {
    shortboard: "Shortboard",
    fish: "Fish",
    gun: "Gun",
    longboard: "Longboard",
    mini_mal: "Mini-Mal",
    funboard: "Funboard",
    foamboard: "Foamboard",
    sup: "SUP",
    board_skimmer: "Board Skimmer",
  }
end
