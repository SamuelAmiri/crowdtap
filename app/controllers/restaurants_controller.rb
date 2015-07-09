class RestaurantsController < ApplicationController


  def index
    if params[:search_term].present?
      @client = GooglePlaces::Client.new(ENV["googleplaces_api_key"])
      searchTerm = params[:search_term]
      query =  searchTerm + " near Santa Monica"
      @restaurant = @client.spots_by_query( query, :types => ['restaurant', 'bar'])
    end
  end

end
