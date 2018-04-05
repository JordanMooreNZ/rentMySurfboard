class ChangeRentedAtToOn < ActiveRecord::Migration[5.1]
  def change
    change_column :bookings, :rented_at, :date
    rename_column :bookings, :rented_at, :rented_on
  end
end
