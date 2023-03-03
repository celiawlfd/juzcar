class House < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :user
  has_one_attached :photo
  has_many :reservations, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :name, :address, :price_per_night, :number_of_people, :description, presence: true
  validates :name, :address, :description, uniqueness: true
  validates :name, length: { minimum: 5 }
  validates :description, length: { minimum: 10 }
  validates :price_per_night, :number_of_people, numericality: { greater_than: 0 }
  validates :number_of_people, :price_per_night, numericality: { only_integer: true }
  validates :photo, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_name_description_and_address,
    against: [ :name, :description, :address ],
    using: {
      tsearch: { prefix: true }
    }
end
