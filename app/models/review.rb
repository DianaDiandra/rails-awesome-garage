class Review < ApplicationRecord
  belongs_to :car

  validates :rating, presence: { message: "cannot be blank" },
  validates :rating, inclusion: { in: 0..5, message: "should be between 0 to 5" }
  validates :comment, presence: { message: "cannot be blank" }
end
