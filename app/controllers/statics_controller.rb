class StaticsController < ApplicationController

	def index
		remspace = params[:search_term].downcase.tr!(" ", "_")
		@beer = Beer.search(remspace)

	end


end
