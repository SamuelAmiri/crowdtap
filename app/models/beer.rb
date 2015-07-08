class Beer < ActiveRecord::Base
	has_many :beerrestaurants
	has_many :restaurants, through: :beerrestaurants

	def self.search term
		
		uri = "http://api.brewerydb.com/v2/search?q='#{term}'&type=beer&key=#{ENV['brewerydb_api_key']}"

		HTTParty.get uri
	end
end
