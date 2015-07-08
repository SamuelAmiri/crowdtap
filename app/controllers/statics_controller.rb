class StaticsController < ApplicationController

	def index
		if params[:search_term].present?
			remspace = params[:search_term].downcase.tr(" ", "_")
			@beer = Beer.search(remspace)
		end

	end


end
