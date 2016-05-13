class MainController < ApplicationController
	before_filter :check_for_mobile

	def index
		if @user_agent == :tablet
			@voted = Vote.already_voted?(request.remote_ip)
			@image = Photo.new
			@current_image = Photo.last
		else

		end
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

	def check_for_mobile
		# request.user_agent =~ /Mobile|webOS/ ? (request.variant = :tablet) : (request.variant = :desktop)
		@user_agent =~ /Mobile|webOS/ ? (request.variant = :tablet) : (request.variant = :desktop)
	end

end



