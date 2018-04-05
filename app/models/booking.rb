class Booking < ApplicationRecord
  belongs_to :surfboard
  belongs_to :user

  enum duration: {
    one_hour: "One Hour",
    four_hours: "Four Hours",
    one_day: "One Day",
    two_days: "Two Days",
    one_week: "One Week"
  }

  enum status: {
    pending: "Pending",
    confirmed: "Confirmed",
    declined: "Declined",
    cancelled: "Cancelled"
  }
end
