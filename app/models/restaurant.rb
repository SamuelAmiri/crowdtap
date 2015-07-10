class Restaurant < ActiveRecord::Base
	has_many :beerrestaurants
	has_many :beers, through: :beerrestaurants

  class << self
    def from_api(restaurant_params)
      restaurant = find_or_create_by()
    end
  end

end
