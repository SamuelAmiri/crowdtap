class RestaurantsController < ApplicationController


  def index

    if params[:search_term].present?
      @client = GooglePlaces::Client.new(ENV["googleplaces_api_key"])
      searchTerm = params[:search_term]
      
      if params[:location].present?
        locationTerm = params[:location]
      else 
        locationTerm = request.location.city
      end

      query =  searchTerm + " near #{locationTerm}"
      @place = @client.spots_by_query( query, :types => ['restaurant', 'bar'])
    end

    @restaurant = []

    if @place.present?
      @place.each do |p|
        @restaurant << p
      end
    end

    @hash = Gmaps4rails.build_markers(@restaurant) do |restaurant, marker|
      marker.lat restaurant.lat
      marker.lng restaurant.lng
      marker.infowindow restaurant.name
      marker.json({ title: restaurant.name })
    end

  end

  #GET "/restaurant/:id"
  def show
  	@restaurant = Restaurant.find(params[:id])
  	
    if params[:search_term].present?
			@beer = Beer.search(params[:search_term])
    end

    #sets up hash for map marker
    @hash = Gmaps4rails.build_markers(@restaurant) do |restaurant, marker|
      marker.lat restaurant.lat
      marker.lng restaurant.long
      marker.infowindow "<a target='blank' href='https://www.google.com/maps/place/"+"#{restaurant.address}"+"'>Get Directions With Google Maps</a>"
      marker.json({ title: restaurant.name })
    end

	end


  def new
  	
  end

  def create
      @restaurant = Restaurant.find_or_create_by(restaurant_params)
          if @restaurant.save
              redirect_to restaurant_path(@restaurant)
          else
              render :index
          end
  end

  private
  	def restaurant_params
  		
  		params.require(:restaurant).permit(:name, :lat, :long, :place_id, :address, :rating, :price, beer_ids:[])

  	end

end
