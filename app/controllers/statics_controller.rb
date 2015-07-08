class StaticsController < ApplicationController

	def index
		@restaurants = Restaurant.all 
		@hash = Gmaps4rails.build_markers(@restaurants) do |restaurant, marker|
		  marker.lat restaurant.lat
		  marker.lng restaurant.long
		  marker.infowindow restaurant.name
		end
		
		@beer = Beer.search(params[:search_term])
		
	end

	
end
