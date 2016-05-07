class MainController < ApplicationController
	def index
		@image = Photo.new
		@current_image = Photo.last
	end

	def create
		@photo = Photo.create(photo_params)	
		redirect_to '/'
	end

	private

	def photo_params
		params.require(:photo).permit(:caption, :image)
	end

end
