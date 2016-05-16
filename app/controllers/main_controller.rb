class MainController < ApplicationController
	before_filter :check_for_mobile, :only => :index

	def index
		if @user_agent == :tablet
			@voted = Vote.already_voted?(request.remote_ip)
			@image = Photo.new
			@error = params['error'] if params['error']
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
		Photo.last.increment!(:uploads_against)
		flash[:errors] = "Failed to upload - the current photo is protected! It can be replaced after #{Photo.last.protection_left} more upload attempts or kills!"
		# redirect '/', error: "Failed to upload - the current photo is protected! It can be replaced after #{Photo.last.protection_left} more upload attempts or kills!"
	end
end



