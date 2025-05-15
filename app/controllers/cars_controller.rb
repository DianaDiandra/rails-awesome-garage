class CarsController < ApplicationController
  def index
    @cars = Car.all
    @custom_datetime = DateTime.new(2001, 2, 3, 4, 5, 6)
  end

  def show
    @car = Car.find(params[:id])
    @reviews = @car.reviews
    @review = Review.new
    @favourite = Favourite.new
  end
end
