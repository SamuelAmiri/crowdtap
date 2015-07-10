class StaticsController < ApplicationController

	def index
		@restaurants = Restaurant.all 
		@hash = Gmaps4rails.build_markers(@restaurants) do |restaurant, marker|
		  marker.lat restaurant.lat
		  marker.lng restaurant.long
		  marker.infowindow restaurant.name
		end
		
		if params[:search_term].present?
			remspace = params[:search_term].downcase.tr(" ", "_")
			@beer = Beer.search(remspace)
		end

	end


end
