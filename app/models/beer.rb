class Beer < ActiveRecord::Base
	has_many :beerrestaurants
	has_many :restaurants, through: :beerrestaurants

	# BreweryDB API search
	# @param term is a string (beer name)
	def self.search term
		# remove any spaces from search term and replace with _
		remspace = term.downcase.tr(" ", "_")
		# combine url with search term and API Key
		uri = "http://api.brewerydb.com/v2/search?q='#{remspace}'&type=beer&withBreweries=Y&key=#{ENV['brewerydb_api_key']}"

		HTTParty.get uri
	end
end
