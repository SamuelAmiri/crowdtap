module API
  class RestaurantsController < ApplicationController
  	def index
      render json: Restaurant.all
    end
  end
end