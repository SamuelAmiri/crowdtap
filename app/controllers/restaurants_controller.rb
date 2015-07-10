class RestaurantsController < ApplicationController


  def index

    if params[:search_term].present?
      @client = GooglePlaces::Client.new(ENV["googleplaces_api_key"])
      searchTerm = params[:search_term]
      query =  searchTerm + " near Santa Monica"
      @place = @client.spots_by_query( query, :types => ['restaurant', 'bar'])
    end
  end

  def show
  	@restaurant = Restaurant.find(params[:id])
  	if params[:search_term].present?
			remspace = params[:search_term].downcase.tr(" ", "_")
			@beer = Beer.search(remspace)
	end

  end

  def new
  	
  end

  def create
      @restaurant = Restaurant.new(restaurant_params)
          if @restaurant.save
              redirect_to restaurant_path(@restaurant.id)
          else
              render :index
          end
  end

  private
  	def restaurant_params
  		params.require(:restaurant).permit(:name, :lat, :long, beer_ids:[])
  	end

end
