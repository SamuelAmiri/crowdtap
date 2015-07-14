class StaticsController < ApplicationController

	def index
	end

	def search
		@restaurants = []
		@search_term = params[:search_term]
		@location = params[:location]

		if params[:range].present?
			@range = params[:range]
		else
			@range = "5"
		end

		@beer = Beer.beer_search(params[:search_term])

		@beer.each do |b|
			b.restaurants.near(@location, @range).each do |r|
				@restaurants << r
			end
		end

		if @search_term.empty?
			flash[:notice] = "You can't search without a search term; please enter a beer and retry!"
			redirect_to "/"
		elsif @location.empty?
			flash[:notice] = "You can't search without a location; please enter a location and retry!"
			redirect_to "/"
		else
			if @restaurants.length < 1
				flash[:notice] = "Sorry! We couldn't find any beer named '#{@search_term}' within #{@range} miles of #{@location}."
				redirect_to "/"
			else
				search_map(@restaurants)
			end
		end

	end

	private

	# sets up the map hash for gmaps4rails
	def search_map(restaurants)
		@restaurants = restaurants
		@hash = Gmaps4rails.build_markers(@restaurants) do |restaurant, marker|
			  marker.lat restaurant.lat
			  marker.lng restaurant.long
			  marker.infowindow "<a href='/restaurants/"+"#{restaurant.id}"+"'>#{restaurant.name}</a>"
		end
	end

end
