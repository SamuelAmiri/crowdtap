class Beerrestaurant < ActiveRecord::Base
  belongs_to :beer
  belongs_to :restaurant
end
