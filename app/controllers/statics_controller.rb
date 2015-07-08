class StaticsController < ApplicationController

	def index
		@restaurants = Restaurant.all 
		@hash = Gmaps4rails.build_markers(@restaurants) do |restaurant, marker|
		  marker.lat restaurant.lat
		  marker.lng restaurant.long
		end
	end
end
