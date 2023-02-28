class House < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  has_many :reservations, dependent: :destroy

  validates :name, :address, :price_per_night, :number_of_people, :description, presence: true
  validates :name, :address, :description, uniqueness: true
  validates :name, length: { minimum: 5 }
  validates :description, length: { minimum: 10 }
  validates :price_per_night, :number_of_people, numericality: { greater_than: 0 }
end
