class MainController < ApplicationController
	def index
		@image = Photo.new
	end

	def create
		p params
		redirect_to '/'
	end
end
