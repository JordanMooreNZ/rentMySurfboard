class AddDefaultStatusToBookings < ActiveRecord::Migration[5.1]
  def change
    change_column :bookings, :status, :string, default: 'Pending'
  end
end
