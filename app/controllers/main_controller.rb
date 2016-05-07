class MainController < ApplicationController
	def index
		@image = Photo.new
		@current_image = Photo.last
	end

	def create
		@photo = Photo.new(photo_params)	
		p request.remote_ip
		p fwd
		# @photo.ip = request.remote_ip
		@photo.save
		redirect_to '/'
	end

	private

	def photo_params
		params.require(:photo).permit(:caption, :image)
	end

end



