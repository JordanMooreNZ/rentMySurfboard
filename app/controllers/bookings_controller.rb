class BookingsController < ApplicationController
  before_action :set_booking, only: [ :edit, :update]

  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
    # @bookings = Booking.where(user: current_user).or(Booking.where(surfboard: current_user.surfboards))
  end

  def new
    @current_user = current_user
    @surfboard = Surfboard.find(params[:surfboard_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    authorize(
      current_user.bookings.create!(
        booking_params.merge(surfboard_id: params[:surfboard_id])
      )
    )

    redirect_to bookings_path, notice: "Booking request has been sent"
  end

  def edit
  end

  def update
    @booking.update!(update_params)
    redirect_to bookings_path, notice: "Booking has been updated"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def booking_params
    params.require(:booking).permit(:duration, :rented_on)
  end

  def update_params
    params.require(:booking).permit(:status)
  end
end
