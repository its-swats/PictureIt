class MainController < ApplicationController
	def index
		@voted = Vote.already_voted?(request.remote_ip)
		@image = Photo.new
		@current_image = Photo.last
		p "*" * 90
		p @current_image
	end

	def create
		@photo = Photo.new(photo_params)	
		@photo.ip = request.remote_ip
		if params[:photo][:image]
			@photo.caption = nil if @photo.caption == ""
			Vote.clear_votes if @photo.save
		end
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



