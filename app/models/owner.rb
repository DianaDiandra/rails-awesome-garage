class Owner < ApplicationRecord
  has_many :cars

  validates :nickname, presence: true, uniqueness: true
end
