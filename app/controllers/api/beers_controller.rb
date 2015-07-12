module API
  class BeersController < ApplicationController
  	def index
      render json: Beer.all
    end
  end
end