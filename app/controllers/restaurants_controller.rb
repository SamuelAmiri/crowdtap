class RestaurantsController < ApplicationController


  def index

    if params[:search_term].present?
      @client = GooglePlaces::Client.new(ENV["googleplaces_api_key"])
      searchTerm = params[:search_term]
      query =  searchTerm + " near Santa Monica"
      @place = @client.spots_by_query( query, :types => ['restaurant', 'bar'])
    end
  end

private
	def restaurant_params
		params.permit(:name, :lat, :long)
	end
end
