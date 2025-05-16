class Car < ApplicationRecord
  belongs_to :owner

  has_many :reviews, dependent: :destroy
  has_many :favourites, dependent: :destroy

  validates :fuel, :year, :model, :brand, presence: true
end
