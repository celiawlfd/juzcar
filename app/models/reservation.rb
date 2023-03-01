class Reservation < ApplicationRecord
  belongs_to :house, dependent: :destroy
  belongs_to :user

  validates :arrival_date, presence: true
  validates :departure_date, presence: true
  validates :arrival_date, comparison: { greater_than: Date.today }
  validates :arrival_date, comparison: { less_than: :departure_date }
  # validates :date_reservation, uniqueness: { scope: :house_dates }

  def check_availability
    @reservations = Reservation.all
    days_booked = []
    @reservations.each do |reservation|
      days_booked << (reservation.arrival_date..reservation.departure_date).to_a
    end
    new_reservation = (arrival_date..departure_date).to_a
    if (new_reservation - days_booked).size < new_reservation.size
      errors.add(:arrival_date, :departure_date, "We already have a booking on those dates")
    end
  end

  private

  def house_dates
    days_booked
  end

  def date_reservation
  end
end
