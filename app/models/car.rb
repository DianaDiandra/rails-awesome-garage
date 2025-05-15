class Car < ApplicationRecord
  belongs_to :owner

  has_many :reviews
  has_many :favourites

  validates :fuel, :year, :model, :brand, presence: true
end
