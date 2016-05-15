class MainController < ApplicationController
	before_filter :check_for_mobile, :only => :index

	def index
		if @user_agent == :tablet
			@voted = Vote.already_voted?(request.remote_ip)
			@image = Photo.new
		end
		@current_image = Photo.last
	end

	def create
		if Photo.last && Photo.last.is_protected?
			handle_protected_photo
		else
			create_new_photo
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
		request.user_agent =~ /Mobile|webOS/ ? (@user_agent = :tablet) : (@user_agent = :desktop)
	end

	def create_new_photo
		@photo = Photo.new(photo_params)	
		if params[:photo][:image]
			@photo.ip = request.remote_ip
			@photo.caption = nil if @photo.caption == ""
			Vote.clear_votes if @photo.save
		end
	end

	def handle_protected_photo
		@error = 'Current Photo is Protected'
		Photo.last.increment!(:uploads_against)
	end


end



