class RestaurantsController < ApplicationController
  before_action :set_restaurants, only: [:show]

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to @restaurant
    else
      render "restaurants/new", status: :unprocessable_entity
    end
  end

  def show
    @review = Review.new
  end

  private

  def set_restaurants
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(
      :category,
      :name,
      :address,
      :phone_number
      )
  end
end
