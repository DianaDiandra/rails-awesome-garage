class FavouritesController < ApplicationController
  before_action :set_car, only: %i[new create]

  def index
    @favourites = Favourite.all
  end

  def new
    @favourite = Favourite.new
  end

  def create
    @favourite = Favourite.new(car: @car)

    if @favourite.save
      redirect_to car_favourites_path, notice: "Added to your garage!"
    else
      redirect_to car_path(@car), alert: "Car is already in your garage."
    end
  end

  def destroy
    @favourite = Favourite.find(params[:id])
    @favourite.destroy
    redirect_to favourites_index_path, notice: "Removed from your garage."
  end

  private

  def set_car
    @car = Car.find(params[:car_id])
  end
end
