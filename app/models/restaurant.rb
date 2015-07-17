class Restaurant < ActiveRecord::Base
	has_many :beerrestaurants
	has_many :beers, through: :beerrestaurants 
	geocoded_by :address, :latitude => :lat, :longitude => :long
	after_validation :geocode
end
