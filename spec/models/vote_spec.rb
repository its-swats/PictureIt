require 'rails_helper'

RSpec.describe Vote, type: :model do
	describe 'Vote#place_vote' do
		it 'creates a new Vote if user has not voted' do 
			Vote.create(vote: true, ip: '127.0.0.1')
			expect{Vote.place_vote(true, '127.0.0.2')}.to change{Vote.count}.by(1)
		end

		it 'does not create a new Vote if user has voted' do
			Vote.create(vote: true, ip: '127.0.0.1')
			expect{Vote.place_vote(true, '127.0.0.1')}.to change{Vote.count}.by(0)
		end
	end

	describe 'Vote#already_voted?' do
		it 'returns true if IP has already voted' do
			Vote.create(vote: true, ip: '127.0.0.1')
			expect(Vote.already_voted?('127.0.0.1')).to be true
		end

		it 'returns false if IP has not voted' do
			Vote.create(vote: true, ip: '127.0.0.1')
			expect(Vote.already_voted?('127.0.0.2')).to be false
		end
	end

	describe 'Vote#clear_votes' do
		it 'deletes all votes' do 
			Vote.create(vote: false, ip: '127.0.0.1')
			Vote.clear_votes
			expect(Vote.count).to eq(0)
		end
	end
end
