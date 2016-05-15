FactoryGirl.define do
	image = Rails.root.to_s + ('/readme_screenshots/01.png')
  factory :photo do
    caption 'Test image caption'
    image 'fake image'
  end
end
