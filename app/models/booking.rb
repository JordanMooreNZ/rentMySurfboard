class Booking < ApplicationRecord
  belongs_to :surfboard
  belongs_to :user

  enum duration: {
    one_hour: "One Hour",
    four_hours: "Four Hours",
    one_day: "One Day",
    one_week: "One Week",
  }

  enum status: {
    confirmed: "Confirmed",
    pending: "Pending",
    declined: "Declined",
    cancelled: "Cancelled"
  }
end
