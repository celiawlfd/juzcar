class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:create]

  def create
    reservations = @house.reservations
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    @reservation.house = @house
    if @reservation.arrival_date.nil? || @reservation.departure_date.nil?
      redirect_to house_path(@house), alert: "Silly Smurf! You need to pick a date"
    elsif check_availability(reservations)
      redirect_to house_path(@house), alert: "Sorry #{current_user.characteristic} Smurf...The dates are not available"
    elsif @reservation.save
      redirect_to house_path(@house), alert: "Smurftastic! Thank you for booking #{@house.name}"
    else
      render "houses/show", status: :unprocessable_entity
    end
  end

  private

  def set_reservation
    @house = House.find(params[:house_id])
  end

  def reservation_params
    params.require(:reservation).permit(:arrival_date, :departure_date)
  end

  def check_availability(reservations)
    days_booked = []
    reservations.each do |reservation|
      days_booked << (reservation.arrival_date..reservation.departure_date).to_a
    end
    days_booked = days_booked.flatten.map(&:jd)
    new_reservation = (Date.iso8601(params[:reservation][:arrival_date])..Date.iso8601(params[:reservation][:departure_date])).to_a
    new_reservation = new_reservation.map(&:jd)
    new_reservation.intersect?(days_booked)
  end
end
