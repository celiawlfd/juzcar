class Reservation < ApplicationRecord
  belongs_to :house, dependent: :destroy
  belongs_to :user

  validates :arrival_date, presence: true
  validates :departure_date, presence: true
  validates :arrival_date, comparison: { greater_than: Date.today }
  validates :arrival_date, comparison: { less_than: :departure_date }
end
