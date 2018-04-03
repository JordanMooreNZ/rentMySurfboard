class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :bookings

  before_destroy :cancel_bookings

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  private

  def cancel_bookings
    self.bookings.each { |booking| booking.update(status: :cancelled) }
  end
end
