class PagesController < ApplicationController
  def home
    @five_star_reviews = Review.where(rating: 5).includes(:car)
  end
end
