class Vote < ActiveRecord::Base

	def self.place_vote(bool, ip)
		if !Vote.find_by(ip: ip)
			@vote = Vote.new
			@vote.vote = bool
			@vote.ip = ip
			@vote.save
		end
	end

	def self.already_voted?(ip)
		Vote.find_by(ip: ip)
	end

	def self.clear_votes
		Vote.delete_all
	end

end
