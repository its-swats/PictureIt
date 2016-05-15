require 'rails_helper'

RSpec.describe MainController, type: :controller do
	describe '#index' do
		it 'detects a user on mobile' do
			@request.headers['HTTP_USER_AGENT'] = "Mobile|WebOS"
			get :index
			expect(controller.instance_variable_get('@user_agent')).to eq(:tablet)
		end

		it 'detects a user on desktop' do
			@request.headers['HTTP_USER_AGENT'] = 'anything else'
			get :index
			expect(controller.instance_variable_get('@user_agent')).to eq(:desktop)
		end
	end


	describe '#create' do
		let(:test_photo){FactoryGirl.create(:photo)}
		let(:uploader){ImageUploader.new(test_photo, :image)}
		let(:upvote){FactoryGirl.create(:keep)}
		
		context 'current photo is protected' do
			it 'will not create a new photo entry if the photo is protected' do
				5.times {Vote.create(vote: true)}
				Photo.create(image: 'fake image', caption: 'fake caption')
				expect {post :create, photo: {image: 'new image', caption: 'new caption'}}.to change{Photo.count}.by(0)
			end

			it 'will increment the photos @uploads_against counter' do
				5.times {Vote.create(vote: true)}
				Photo.create(image: 'fake image', caption: 'fake caption')
				expect {post :create, photo: {image: 'new image', caption: 'new caption'}}.to change{Photo.last.uploads_against}.by(1)
			end
		end

		context 'current photo is not protected' do
			it 'creates a new photo entry and changes count by 1 when an image is provided' do
				expect{post :create, photo: test_photo.attributes}.to change{Photo.count}.by(1)
			end

			it 'does not create a new photo entry when an image is not provided' do
				expect {post :create, photo: {caption: 'test'}}.to change{Photo.count}.by(0)
			end

			it 'does not require a caption to create an entry' do
				expect {post :create, photo: {image: 'fake image'}}.to change{Photo.count}.by(1)
			end

			it 'clears all votes when a new image is uploaded' do
				upvote.save
				post :create, photo: {image: 'test image'}
				expect(Vote.count).to eq(0)
			end
		end
	end

	describe '#kill' do
		it 'creates a new downvote when accessed' do
			expect {post :kill}.to change{Vote.count}.by(1)
		end
	end

	describe '#keep' do
		it 'creates a new upvote when accessed' do
			expect {post :keep}.to change{Vote.count}.by(1)
		end
	end
end
