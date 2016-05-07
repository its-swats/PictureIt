class MainController < ApplicationController
	def index
		@image = Photo.new
		@current_image = Photo.last
	end

	def create
		@photo = Photo.new(photo_params)	
		@photo.ip = request.remote_ip
		@photo.save
		Vote.clear_votes
		redirect_to '/'
	end

	def keep
		Vote.place_vote(true, request.remote_ip)
		redirect_to '/'
	end

	def kill
		Vote.place_vote(false, request.remote_ip)
		redirect_to '/'
	end

	private

	def photo_params
		params.require(:photo).permit(:caption, :image)
	end
end



