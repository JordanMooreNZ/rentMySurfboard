class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.references :surfboard, foreign_key: true
      t.references :user, foreign_key: true
      t.string :duration
      t.datetime :rented_at
      t.string :status

      t.timestamps
    end
  end
end
