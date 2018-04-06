module ApplicationHelper
  def duration_options(surfboard)
    Booking.durations.inject({}) do |new_hash, (key,label)|
      new_hash[label + " - $#{surfboard.price_hash[key]}"] = key
      new_hash
    end
  end
end
