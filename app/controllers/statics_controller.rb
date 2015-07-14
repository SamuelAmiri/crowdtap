class StaticsController < ApplicationController

	def index
		@restaurants1 = []

		if params[:location].present?
			@location = params[:location]
		else 
			@location = request.location.city
		end


		@beer = Beer.beer_search(params[:search_term]).order("created_at DESC")	
		@beer.each do |b|
			b.restaurants.near(@location, params[:range]).each do |r|
				@restaurants1 << r
			end
		end

		@restaurants = Restaurant.all
		@hash = Gmaps4rails.build_markers(@restaurants1) do |restaurant, marker|
		  marker.lat restaurant.lat
		  marker.lng restaurant.long
		  marker.infowindow restaurant.name
		end

	end

	def show
	end

end
