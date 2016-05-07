class MainController < ApplicationController
	def index
		@image = Photo.new
		@current_image = Photo.last
	end

	def create
		@photo = Photo.new(photo_params)	
		@photo.ip = request.remote_ip
		@photo.save
		redirect_to '/'
	end

	def keep
		@vote = Vote.new
		@vote.vote = true
		@vote.ip = request.remote_ip
		@vote.save
		redirect_to '/'
	end

	def kill
		@vote = Vote.new
		@vote.vote = false
		@vote.ip = request.remote_ip
		@vote.save
		redirect_to '/'
	end

	private

	def photo_params
		params.require(:photo).permit(:caption, :image)
	end
end



