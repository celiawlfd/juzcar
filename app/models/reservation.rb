class Reservation < ApplicationRecord
  belongs_to :house
  belongs_to :user

  validates :house, uniqueness: { scope: :user }
end
