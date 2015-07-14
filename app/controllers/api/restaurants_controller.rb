module API
  class RestaurantsController < ApplicationController
  	def index
      render json: Restaurant.all
    end
    def show 
    	render json: Restaurant.find(params[:id]).beers
    end
  end
end