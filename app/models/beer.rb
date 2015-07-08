class Beer < ActiveRecord::Base
	has_many :beerrestaurants
	has_many :restaurants, through: :beerrestaurants
end
