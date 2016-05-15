require 'rails_helper'

RSpec.describe Photo, type: :model do
	let (:photo){Photo.create(image: 'test', uploads_against: 1)}
	describe 'photo#is_protected?' do
		it 'returns true if a photo has more Keeps than Kills + Uploads Against' do
			5.times {Vote.create(vote: true)}
			2.times {Vote.create(vote: false)}
			expect(photo.is_protected?).to be true
		end

		it 'returns false if a photo has more Kills + Uploads Against than Keeps' do
			2.times {Vote.create(vote: true)}
			5.times {Vote.create(vote: false)}
			expect(photo.is_protected?).to be false
		end
	end
end
