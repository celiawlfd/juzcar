class Review < ApplicationRecord
  belongs_to :house
  validates :content, :rating, presence: true
  validates :content, length: { minimum: 10 }
  validates :rating, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
end
