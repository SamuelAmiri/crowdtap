module API
  class BeerrestaurantsController < ApplicationController
  	def index
      render json: Beerrestaurant.all
    end
  end
end