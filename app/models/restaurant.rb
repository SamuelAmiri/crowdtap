class Restaurant < ActiveRecord::Base
	has_many :beerrestaurants
	has_many :beers, through: :beerrestaurants


end
