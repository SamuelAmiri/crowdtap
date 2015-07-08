class StaticsController < ApplicationController

	def index
		
		@beer = Beer.search(params[:search_term])

	end

	
end
