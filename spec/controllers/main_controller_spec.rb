require 'rails_helper'

RSpec.describe MainController, type: :controller do
	
	describe '#create' do
		include CarrierWave::Test::Matchers
		let(:test_photo){FactoryGirl.create(:photo)}
		let(:uploader){ImageUploader.new(test_photo, :image)}

		it 'creates a new photo entry and changes count by 1 when an image is provided' do
			expect{post :create, photo: test_photo.attributes}.to change{Photo.count}.by(1)
		end

		it 'does not create a new photo entry when an image is not provided' do
			expect {post :create, photo: {caption: 'test'}}.to change{Photo.count}.by(0)
		end

		it 'does not require a caption to create an entry' do
			expect {post :create, photo: {image: 'fake image'}}.to change{Photo.count}.by(1)
		end
	end
end
