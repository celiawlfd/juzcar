class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:create]

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    @reservation.house = @house
    if @reservation.save
      redirect_to house_path(@house)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_reservation
    @house = House.find(params[:house_id])
  end

  def reservation_params
    params.require(:reservation).permit(:arrival_date, :departure_date)
  end
end
